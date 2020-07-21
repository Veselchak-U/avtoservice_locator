import 'package:avtoservicelocator/bloc/proposal_bloc.dart';
import 'package:avtoservicelocator/data/utils.dart';
import 'package:avtoservicelocator/model/proposal_item.dart';
import 'package:flutter/material.dart';

class ProposalScreenItem extends StatelessWidget {
  ProposalScreenItem(this._proposalItem, this._bloc);

  final ProposalItem _proposalItem;
  final ProposalBloc _bloc;

  @override
  Widget build(BuildContext context) {
    var bDazzledBlueColor = Color.fromARGB(0xFF, 0x2E, 0x58, 0x94);

    var row1 = Row(
      children: <Widget>[
        Text(
          '${_proposalItem.name}',
          style: TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
        Expanded(child: Container()),
        Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
//              border: BoxBorder(),
              color: bDazzledBlueColor,
            ),
            padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
            transform: Matrix4.rotationZ(0.1),
            child: Text(
              '\u{2022}  ${_proposalItem.price} \u{20BD}',
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ))
      ],
    );

    var row2 = Icon(
      Icons.star,
      color: Colors.black38,
    );

    var row3 = Row(
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
    );

    var row4 = Row(
      children: <Widget>[
        Icon(
          Icons.map,
          color: Colors.blue,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          _proposalItem.address,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: bDazzledBlueColor),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );

    var row5 = Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: bDazzledBlueColor, borderRadius: BorderRadius.circular(4)),
          padding: EdgeInsets.all(4.0),
          child: Text(
            _proposalItem.rating.toString(),
            style: TextStyle(
                fontSize: 18.0,
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
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: bDazzledBlueColor),
          overflow: TextOverflow.ellipsis,
        ),
        Expanded(child: Container()),
        Text(
          Utils.counterFeedbacksToText(count: _proposalItem.counterFeedbacks),
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black38),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );

    return InkWell(
      onTap: () {
        _bloc.onTapProposalItem(item: _proposalItem);
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
                height: 8.0,
              ),
              row1,
              SizedBox(
                height: 8.0,
              ),
              row2,
              SizedBox(
                height: 8.0,
              ),
              row3,
              SizedBox(
                height: 8.0,
              ),
              row4,
              SizedBox(
                height: 16.0,
              ),
              row5,
            ],
          )),
    );
  }
}
