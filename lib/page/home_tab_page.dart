import 'package:flutter/material.dart';
import 'package:flutter_app/widget/home_tab_list.dart';

class HomeTabPage extends StatefulWidget {
  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage>
    with TickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "专题", '直播', '通知', "乐活"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                tabs: tabs.map((e) => Tab(text: e)).toList(),
//                isScrollable: true,
                labelColor: Colors.black,
                labelPadding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 103, 116, 255), width: 3),
                    insets: EdgeInsets.only(bottom: 2)),
              )),
          Flexible(
            child: TabBarView(
                controller: _tabController,
                children: tabs.map((e) {
                  return Container(
                    alignment: Alignment.center,
                    child: HomeTabList(),
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}
