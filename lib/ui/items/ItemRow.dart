import 'package:flutter/material.dart';
import '../../model/Item.dart';
import '../details/detailPage.dart';
import '../../ui/details/detailPage.dart';
import 'package:flare_flutter/flare_actor.dart';
import '../../ui/details/separator.dart';

import '../../fontsStyling.dart';

class ItemRow extends StatelessWidget {
  final Item item;
  final bool horizontal;

  ItemRow(this.item, {this.horizontal = true});

  ItemRow.vertical(this.item) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final itemThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "item-hero-${item.id}",
        child: Container(
          height: 95.0,
          width: 95.0,
          child: FlareActor("assets/animations/planets.flr",
              animation: item.name),
        ),
      ),
    );

    Widget _itemValue({String value, String image}) {
      return new Container(
        child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          new Image.asset(image, height: 12.0),
          new Container(width: 8.0),
          new Text(item.gravity, style: regularTextStyle),
        ]),
      );
    }

    final itemCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(item.name, style: headerTextStyle),
          new Container(height: 10.0),
          new Text(item.location, style: subHeaderTextStyle),
          new Separator(),
          Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                    flex: horizontal ? 1 : 0,
                    child: _itemValue(
                        value: item.distance,
                        image: 'assets/img/ic_distance.png')),
                new Container(
                  width: 32.0,
                ),
                new Expanded(
                    flex: horizontal ? 1 : 0,
                    child: _itemValue(
                        value: item.gravity,
                        image: 'assets/img/ic_gravity.png'))
              ],
            ),
          ),
        ],
      ),
    );

    final itemCard = new Container(
      child: itemCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new GestureDetector(
        onTap: horizontal
            ? () => Navigator.of(context).push(
                  new PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new DetailPage(item),
                    transitionsBuilder: (context, animation, secondaryAnimation,
                            child) =>
                        new FadeTransition(opacity: animation, child: child),
                  ),
                )
            : null,
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              itemCard,
              itemThumbnail,
            ],
          ),
        ));
  }
}
