import 'package:avtoservicelocator/bloc/autoservice_bloc.dart';
import 'package:avtoservicelocator/bloc/common/bloc_provider.dart';
import 'package:avtoservicelocator/data/utils.dart';
import 'package:avtoservicelocator/model/autoservice.dart';
import 'package:avtoservicelocator/model/user_feedback.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AutoserviceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AutoserviceScreenState();
}

class _AutoserviceScreenState extends State<AutoserviceScreen> {
  AutoserviceBloc _bloc;
  AutoService _autoService;
  List<String> _photos;
  List<UserFeedback> _feedbacks;
  int _carouselFeedbacksPageNumber;
  int _carouselImagePageNumber;
  final bDazzledBlueColor = Color.fromARGB(0xFF, 0x2E, 0x58, 0x94);

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.context = context;
    _autoService = _bloc.autoService;
    _photos = _bloc.autoService.photos;
    _feedbacks =
        _bloc.autoService.feedbacks == null ? [] : _bloc.autoService.feedbacks;
    _carouselFeedbacksPageNumber = 1;
    _carouselImagePageNumber = 1;
  }

  @override
  Widget build(BuildContext context) {
    var buttonBack = Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: _bloc.onTapButtonBack,
        ));

    var imagesCarousel = Column(children: <Widget>[
      CarouselSlider(
        options: CarouselOptions(
            height: 250,
            viewportFraction: 1.0,
            autoPlay: true,
            onPageChanged: _carouselImagePageChanged),
        items: _photos
            .map((item) => Container(
                  child: Center(child: Image.network(item, fit: BoxFit.cover)),
                ))
            .toList(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _photos.map((item) {
          int index = _photos.indexOf(item);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _carouselImagePageNumber == index + 1
                  ? Color.fromRGBO(0, 0, 0, 0.9)
                  : Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        }).toList(),
      )
    ]);

    var row1 = Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
              _autoService.name,
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              overflow: TextOverflow.ellipsis,
            )),
            Container(
              decoration: BoxDecoration(
                  color: bDazzledBlueColor,
                  borderRadius: BorderRadius.circular(4)),
              padding: EdgeInsets.all(4.0),
              child: Text(
                _autoService.userRating.toString(),
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ));

    var row2 = Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.star,
                    color: Colors.black38,
                  ))),
          Text(
            Utils.counterFeedbacksToText(count: _autoService.feedbacks.length),
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );

    var row3 = Padding(
      padding: EdgeInsets.only(left: 16, top: 4, right: 16, bottom: 16),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.credit_card,
            color: Colors.orangeAccent,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            '10% кэшбек',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );

    var isVisible = _bloc.isSubscribeButtonVisible;
    var isClickable = _bloc.isSubscribeButtonEnable;
    var buttonSubscribe = isVisible
        ? Padding(
            padding: EdgeInsets.all(16.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              color: isClickable ? Colors.lightBlueAccent : Colors.black12,
              minWidth: 350,
              elevation: isClickable ? 2 : 0,
              highlightElevation: isClickable ? 8 : 0,
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(_bloc.subscribeButtonText,
                      style: TextStyle(fontSize: 16.0, color: Colors.white))),
              onPressed: _onPressedSubscribeButton,
            ),
          )
        : SizedBox.shrink();

    var location = InkWell(
        onTap: _bloc.onTapAutoserviceLocation,
        splashColor: Colors.lightBlueAccent,
        highlightColor: Colors.lightBlueAccent,
        child: Padding(
          padding: EdgeInsets.fromLTRB(11, 8, 16, 8),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.blue,
                size: 34,
              ),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                  child: Text(
                _autoService.address,
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                overflow: TextOverflow.ellipsis,
              )),
              SizedBox(
                width: 8.0,
              ),
              Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        ));

    var row4 = Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Описание',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ));

    var row5 = Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(_autoService.description,
            style: TextStyle(fontSize: 16.0, color: Colors.black)));

    var row6 = _feedbacks.isEmpty
        ? SizedBox(height: 16)
        : Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('Отзывы',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Text('  $_carouselFeedbacksPageNumber/${_feedbacks.length}',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black12)),
              ],
            ));

    var feedbacksCarousel = _feedbacks.isEmpty
        ? SizedBox.shrink()
        : Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: 100,
                        enableInfiniteScroll: false,
                        viewportFraction: 1.0,
                        onPageChanged: _carouselFeedbacksPageChanged),
                    items: _feedbacks
                        .map((item) => _getFeedbacksItem(item))
                        .toList(),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _feedbacks.map((UserFeedback item) {
                  int index = _feedbacks.indexOf(item);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _carouselFeedbacksPageNumber == index + 1
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              )
            ],
          );

    return Scaffold(
        body: Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            imagesCarousel,
            row1,
            row2,
            row3,
            location,
            buttonSubscribe,
            row4,
            row5,
            row6,
            feedbacksCarousel
          ],
        ),
        Align(alignment: Alignment(-0.97, -0.91), child: buttonBack)
      ],
    ));
  }

  Widget _getFeedbacksItem(UserFeedback item) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(item.userName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: bDazzledBlueColor))),
                Row(
                  children: <Widget>[
                    Text('Оценка пользователя ',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: bDazzledBlueColor)),
                    Container(
                      decoration: BoxDecoration(
                          color: bDazzledBlueColor,
                          borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        '${item.rating}',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text('${item.text}',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black)),
            SizedBox(height: 8),
            Text(DateFormat('dd.MM.yyyy').format(item.date),
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black45))
          ],
        ));
  }

  void _carouselFeedbacksPageChanged(
      int index, CarouselPageChangedReason reason) {
    setState(() {
      _carouselFeedbacksPageNumber = index + 1;
    });
  }

  void _carouselImagePageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      _carouselImagePageNumber = index + 1;
    });
  }

  void _onPressedSubscribeButton() {
    setState(() {
      _bloc.onPressedSubscribeButton();
    });
  }
}
