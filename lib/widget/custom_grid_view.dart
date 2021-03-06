import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: non_constant_identifier_names
Widget CustomGridView({List data}) {
  if (data == null || data.length == 0) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey[300],
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        );
      },
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, childAspectRatio: 1.05),
    );
  }
  return SingleChildScrollView(
    padding: new EdgeInsets.all(4),
    scrollDirection: Axis.horizontal,
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: Iterable.generate(data.length, (index) {
            return GestureDetector(
              onTap: () {
                print('123');
              },
              child: Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(140),
                height:  ScreenUtil().setHeight(170),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.network(
                      data[index].icon,
                      width:ScreenUtil().setWidth(80),
                      height: ScreenUtil().setWidth(80),
                    ),
                    Text(
                      data[index].moduleName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black54, fontSize: ScreenUtil().setSp(30)),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    ),
  );
}
