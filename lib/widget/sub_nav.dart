import 'package:flutter/material.dart';
import 'package:flutter_app/model/local_nav_list_model.dart';
import 'package:flutter_app/model/sub_nav_model.dart';
import 'package:flutter_app/widget/web_view.dart';

class SubNav extends StatelessWidget {
  final List<SubNavList> subNavList;
  final Color color;
  final double sepratescale;

  const SubNav({Key key, this.subNavList, this.color, this.sepratescale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //container 方便定义宽高
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (subNavList == null) return null;
    List<Widget> items = [];
    subNavList.forEach((model) {
      items.add(_item(context, model));
    });
    int seprate = (subNavList.length / sepratescale + 0.5).toInt();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(children: items.sublist(0, seprate)),
        SizedBox(
          child: Container(
            height: 10.0,
          ),
        ),
//        lastBottom(subNavList),
        Row(children: items.sublist(seprate, seprate * 2)),

        sepratescale == 4
            ? Row(children: items.sublist(seprate * 2  , seprate * 2 + 3))
            : SizedBox(
                child: Container(
                  height: 5.0,
                ),
              ),
      ],
    );
  }

  Widget _item(BuildContext context, SubNavList model) {
    return Expanded(
      child: GestureDetector(
        //手势
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebView(
                        url: model.url,
                        title: model.title,
                        hideAppBar: model.hideAppBar,
                      )));
        },

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              model.icon,
              width: 20,
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                model.title,
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
            )
          ],
        ),
      ),
      flex: 1,
    );
  }
}

//Widget lastBottom(List<SubNavList> i) {
//  i.forEach((f) {
//   return Row(
//       children:
//       items.sublist(subNavList.length - seprate, subNavList.length)),
//  });
//}
