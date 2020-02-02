import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/config/i18n.dart';
import 'package:flutter_app/config/router_manger.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _countdownController;

  @override
  void initState() {
    _countdownController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _countdownController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _countdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Image.network(
          'http://zdg.rzdgrm.cn:9090/upload_pics/main/img20190705/25_20190705045901_934_5349.png',
        ),
        Align(
          alignment: Alignment.bottomRight,
          child:   InkWell(
              onTap: () {
                nextPage(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                margin: EdgeInsets.only(right: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.black.withAlpha(100),
                ),
                child: AnimatedCountdown(
                  context: context,
                  animation:
                      StepTween(begin: 3, end: 0).animate(_countdownController),
                ),
              ),
            ),
        )
      ]),
    ),
    );
  }
}

class AnimatedCountdown extends AnimatedWidget {
  final Animation<int> animation;

  AnimatedCountdown({key, this.animation, context})
      : super(key: key, listenable: animation) {
    this.animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        nextPage(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = animation.value + 1;
    return Text(
      (value == 0 ? '' : '$value | ') + S.of(context).splashSkip,
      style: TextStyle(color: Colors.white),
    );
  }
}

void nextPage(context) {
  Navigator.of(context).pushReplacementNamed(RouteName.tab);
}
//
//class GuidePage extends StatefulWidget {
//  static const List<String> images = <String>[
//    'guide_page_1.png',
//    'guide_page_2.png',
//    'guide_page_3.png',
//    'guide_page_4.png'
//  ];
//
//  @override
//  _GuidePageState createState() => _GuidePageState();
//}
//
//class _GuidePageState extends State<GuidePage> {
//  int curIndex = 0;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Container(
//      color: Theme.of(context).primaryColor,
//      child: Stack(
//        alignment: Alignment(0, 0.87),
//        children: <Widget>[
//          Swiper(
//              itemBuilder: (ctx, index) => Image.asset(
//                    'assets/images/${GuidePage.images[index]}',
//                    fit: BoxFit.fill,
//                  ),
//              itemCount: GuidePage.images.length,
//              loop: false,
//              onIndexChanged: (index) {
//                setState(() {
//                  curIndex = index;
//                });
//              }),
//          Offstage(
//            offstage: curIndex != GuidePage.images.length - 1,
//            child: CupertinoButton(
//              color: Theme.of(context).primaryColorDark,
//              child: Text('点我开始'),
//              onPressed: () {
//                nextPage(context);
//              },
//            ),
//          )
//        ],
//      ),
//    ));
//  }
//}
