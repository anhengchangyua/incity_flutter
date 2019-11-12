import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/modules_model.dart';
import 'package:flutter_app/model/sub_nav_model.dart';
import 'package:flutter_app/widget/wrap_widget.dart';
import 'package:flutter_app/widget/custom_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ServicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ServicePageState();
  }
}

class _ServicePageState extends State<ServicePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  RefreshController _refreshController1 =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    print('123123');
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController1.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    _refreshController1.loadComplete();
  }

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _list = new List();
    _list.add(new _ServiceHeader(animation: animation));
    _list.add(CustomGridView(data: dataModule));
    _list.add(Container(
        margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
          child: CachedNetworkImage(
            imageUrl:
                'http://zdg.rzdgrm.cn:9090/upload_pics/main_start/img20190705/25_20190705023025_885_8862.jpg',
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return SizedBox(
                  width: 115,
                  height: 85,
                  child:
                      CupertinoActivityIndicator(radius: min(10.0, 115 / 3)));
            },
          ),
        )));
    _list.add(Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.assistant_photo,
            color: Colors.deepOrange,
          ),
          Padding(padding: EdgeInsets.only(left: 5)),
          Text(
            '政务',
            style: TextStyle(color: Colors.black, fontSize: 16),
          )
        ],
      ),
      width: 90,
      height: 40,
      padding: EdgeInsets.only(left: 15.0, right: 8.0),
    ));
    _list.add(new WrapWidget(dataList: datas));
    _list.add(Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.assistant_photo,
            color: Colors.deepOrange,
          ),
          Text(
            '民生',
            style: TextStyle(color: Colors.black, fontSize: 16),
          )
        ],
      ),
      width: 90,
      height: 40,
      padding: EdgeInsets.only(left: 15.0, right: 8.0),
    ));
    _list.add(new WrapWidget(dataList: dataPerson));

    return RefreshConfiguration(
        enableScrollWhenTwoLevel: false,
        maxOverScrollExtent: 120,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Scaffold(
              backgroundColor: Colors.white,
              body: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: ClassicHeader(),
                controller: _refreshController1,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: ListView(
                  children: _list,
                ),
              )),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _ServiceHeader extends AnimatedWidget {
  static final _opacityTween = new Tween<double>(begin: 0.8, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 340.0, end: 400.0);

  _ServiceHeader({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Stack(
      children: <Widget>[
        Center(
          child: new Opacity(
            opacity: _opacityTween.evaluate(animation),
            child: new Container(
              height: 165,
              width: _sizeTween.evaluate(animation),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      'http://zdg.rzdgrm.cn:9090/upload_pics/main_start/img20190710/25_20190710111744_473_7193.jpg',
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return SizedBox(
                        width: 200,
                        height: 165,
                        child: CupertinoActivityIndicator(
                            radius: min(10.0, 115 / 3)));
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
            left: 40,
            top: 40,
            child: Text(
              '日照东港',
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
        Positioned(
            left: 60,
            top: 90,
            child: Text(
              '32℃',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ))
      ],
    );
  }
}
