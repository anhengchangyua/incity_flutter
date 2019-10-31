import 'package:flutter/material.dart';
import 'package:flutter_app/model/sub_nav_model.dart';

/*
* 可以让子控件自动换行的控件
*
* */
class WrapWidget extends StatelessWidget {
  final List dataList;

  const WrapWidget({Key key, this.dataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 2, //主轴上子控件的间距
        runSpacing: 5, //交叉轴上子控件之间的间距
        children: Boxs(), //要显示的子控件集合
      ),
    );
  }

  List<Widget> Boxs() => List.generate(dataList.length, (index) {
        return Container(
          width: 100,
          height: 35,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(
                dataList[index].icon,
                width: 20.0,
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6),
                child: Text(
                  dataList[index].title,
                  style: TextStyle(fontSize: 15, color: Colors.black54,fontFamily: 'FZBIAOYSJW'),
                ),
              )
            ],
          ),
        );
      });
}
