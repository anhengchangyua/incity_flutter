import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  @override
  void initState() {
    super.initState();
    _collectController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
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
                    constraints: BoxConstraints.expand(height: ScreenUtil().setWidth(2)),
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
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(5)),
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(8)),
              child: Text(
                '继山东编导艺考联考被曝疑似出现泄题和作弊的情况。江西编导艺考联考也被曝疑似出现泄题和作弊的情况。',
                style: TextStyle(
                    letterSpacing: 0.5,
                    fontSize:ScreenUtil().setSp(28),
                    color: Color(0xff111111),
                    fontFamily: 'FZBIAOYSJW'),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setWidth(40)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Text(
                      '2019-08-22',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
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
                         fontSize: ScreenUtil().setSp(20),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
        SizedBox(
          width: ScreenUtil().setWidth(35) ,
        ),
        Container(
          width:  ScreenUtil().setWidth(200),
          margin: EdgeInsets.only(top:ScreenUtil().setWidth(4)),
          child: CachedNetworkImage(
            imageUrl:
            'https://resources.ninghao.org/images/candy-shop.jpg',
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return SizedBox(
                  width:  ScreenUtil().setWidth(150),
                  child: CupertinoActivityIndicator(radius: min(10.0, 115 / 3)));
            },
          ),
        ),
      ],
    );
  }
}
