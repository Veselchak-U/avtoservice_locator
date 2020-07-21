import 'package:avtoservicelocator/bloc/search_bloc.dart';
import 'package:avtoservicelocator/data/utils.dart';
import 'package:avtoservicelocator/model/autoservice_item.dart';
import 'package:flutter/material.dart';

class SearchScreenItem extends StatelessWidget {
  SearchScreenItem(this._autoServiceItem, this._bloc);

  final AutoServiceItem _autoServiceItem;
  final SearchBloc _bloc;

  @override
  Widget build(BuildContext context) {
    var bDazzledBlueColor = Color.fromARGB(0xFF, 0x2E, 0x58, 0x94);

    var row1 = Row(
      children: <Widget>[
        Expanded(
            child: Text(
          _autoServiceItem.name,
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        )),
        Icon(
          Icons.star,
          color: Colors.black38,
        )
      ],
    );

    var row2 = Row(
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
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.black38),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );

    var row3 = Row(
      children: <Widget>[
        Icon(
          Icons.map,
          color: Colors.blue,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          _autoServiceItem.address,
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: bDazzledBlueColor),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );

    var row4 = Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: bDazzledBlueColor, borderRadius: BorderRadius.circular(4)),
          padding: EdgeInsets.all(4.0),
          child: Text(
            _autoServiceItem.userRating.toString(),
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          'Рейтинг пользователей',
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: bDazzledBlueColor),
          overflow: TextOverflow.ellipsis,
        ),
        Expanded(child: Container()),
        Text(
          Utils.counterFeedbacksToText(
              count: _autoServiceItem.counterFeedbacks),
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.black38),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );

    return InkWell(
      onTap: () {
        _bloc.onTapAutoServiceItem(item: _autoServiceItem);
      },
      highlightColor: Colors.blue,
      splashColor: Colors.blue,
      child: Padding(
          padding:
              EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 0.0,
              ),
              row1,
              SizedBox(
                height: 0.0,
              ),
              row2,
              SizedBox(
                height: 0.0,
              ),
              row3,
              SizedBox(
                height: 4.0,
              ),
              row4,
            ],
          )),
    );
  }
}
