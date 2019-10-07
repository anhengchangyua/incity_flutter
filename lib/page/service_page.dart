import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _list = new List();
    _list.add(new _ServiceHeader(animation: animation));

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Scrollbar(
              child: new ListView(
        children: _list,
      ))),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
              height: 180,
              width: _sizeTween.evaluate(animation),
              child: CachedNetworkImage(
                imageUrl:
                    'http://zdg.rzdgrm.cn:9090/upload_pics/main_start/img20190710/25_20190710111744_473_7193.jpg',
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return DecoratedBox(
                    decoration: BoxDecoration(color: Colors.grey[300]),
                  );
                },
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
