import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ignore: non_constant_identifier_names
Widget HomeListItem() {
  return SliverList(
    delegate: SliverChildBuilderDelegate((context, index) {
      return ListItem();
    }, childCount: 11),
  );
}

class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem>
    with SingleTickerProviderStateMixin {
  AnimationController _collectController;
  Animation _collectAnim;

  @override
  void initState() {
    super.initState();
    _collectController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _collectController, curve: Curves.easeOut);
    _collectAnim = Tween<double>(begin: 1, end: 1.8).animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return Material(
        color: backgroundColor,
        child: Ink(
          child: InkWell(
            onTap: () {
              print('aaaaa');
            },
            child: Container(
              height: 100.0,
              child: Column(
                children: <Widget>[
                  // 内容视图
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                    child: _covertListItem(0),
                  ),
                  // 分割线
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    color: Color(0xffeaeaea),
                    constraints: BoxConstraints.expand(height: 2.0),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _collectController?.dispose();
    super.dispose();
  }
}

Widget _covertListItem(int type) {
  switch (type) {
    case -1:
      return _listItem1();
    case 2:
      return _listItem1();
  }
  return _listItem1();
}

class _listItem1 extends StatelessWidget {
  const _listItem1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          // textDirection:,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Container(
              height: 60,
              padding: EdgeInsets.only(top: 5),
              margin: EdgeInsets.only(left: 8),
              child: Text(
                '继山东编导艺考联考被曝疑似出现泄题和作弊的情况。江西编导艺考联考也被曝疑似出现泄题和作弊的情况。',
                style: TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 16.0,
                    color: Color(0xff111111),
                    fontFamily: 'FZBIAOYSJW'),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Text(
                      '2019-08-22',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Container(
                    width: 30.0,
                    height: 20.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepOrangeAccent,
                          width: 1.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(4.0)),
                    child: Text(
                      '置顶',
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 11.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
        SizedBox(
          width: 17.0,
        ),
        Container(
          height: 85.0,
          width: 115.0,
          margin: EdgeInsets.only(top: 2.0),
          child: CachedNetworkImage(
            imageUrl:
            'https://resources.ninghao.org/images/candy-shop.jpg',
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return SizedBox(
                  width: 115,
                  height: 85,
                  child: CupertinoActivityIndicator(radius: min(10.0, 115 / 3)));
            },
          ),
        ),
      ],
    );
  }
}
