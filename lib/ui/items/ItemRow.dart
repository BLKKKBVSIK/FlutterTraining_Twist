import 'package:flutter/material.dart';
import 'package:planettwist/model/Item.dart';
import 'package:planettwist/ui/items/itemCardContent.dart';

class ItemRow extends StatelessWidget {
  final Item item;

  ItemRow(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: 124.0,
            margin: EdgeInsets.only(left: 46.0),
            decoration: BoxDecoration(
              color: Color(0xFF333366),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: itemCardContent(item),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            alignment: FractionalOffset.centerLeft,
            child: Image(
              image: AssetImage(item.image),
              height: 92.0,
              width: 92.0,
            ),
          ),
        ],
      ),
    );
  }
}
