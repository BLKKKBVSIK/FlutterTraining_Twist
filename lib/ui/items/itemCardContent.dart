import 'package:flutter/material.dart';
import '../../fontsStyling.dart';
import '../../model/Item.dart';

class ItemCardContent extends StatelessWidget {
  final Item item;

  ItemCardContent(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text(
            item.name,
            style: headerTextStyle,
          ),
          Container(height: 10.0),
          Text(item.location, style: subHeaderTextStyle),
          Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: Color(0xff00c6ff)),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(children: <Widget>[
                    Image.asset("assets/img/ic_distance.png", height: 12.0),
                    Container(width: 8.0),
                    Text(item.distance, style: regularTextStyle),
                  ]),
                ),
                Expanded(
                  child: Row(children: <Widget>[
                    Image.asset("assets/img/ic_gravity.png", height: 12.0),
                    Container(width: 8.0),
                    Text(item.gravity, style: regularTextStyle),
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
