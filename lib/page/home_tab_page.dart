import 'package:flutter/material.dart';
import 'package:flutter_app/widget/custom_sliver_app_bar_delegate.dart';
import 'package:flutter_app/widget/home_tab_list.dart';
import 'package:flutter_app/widget/self_drawer.dart';


class HomeTabPage extends StatefulWidget {
  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage>
    with TickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  ScrollController _scrollController;
  List tabs = ["新闻", "专题", '直播', '通知', "乐活"];
  BuildContext innerContext;

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      print('123123');
    });
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Scaffold(
          body: Builder(builder: (context) {
            innerContext = context;
            return Stack(
              children: <Widget>[
                DecoratedBox(
                    decoration: _themeGradientDecoration(),
                    child: SafeArea(
                        child: NestedScrollView(
                      controller: _scrollController,
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverToBoxAdapter(
                            child: Container(
                              decoration: _themeGradientDecoration(),
                              child: appBarHeader(),
                            ),
                          ),
                          //因为子页TabBarView不一定都会用CustomScrollView,放弃使用SliverOverlapAbsorber + SliverOverlapInjector
                          //影响是滑到顶部后子页还能继续上滑一小段距离（我的tabBarView是包了一层上面有圆角的DecoratedBox的，滑动列表时可发现圆角背景还会上滑而不是固定住，但影响不大，页面和它内部滚动widget的滚动衔接还是在的，所以看上去都是在滑动）
                          SliverPersistentHeader(
                            pinned: true,
                            floating: true,
                            delegate: CustomSliverAppBarDelegate(
                              minHeight: 40,
                              maxHeight: 40,
                              child: Container(
                                height: 40,
                                decoration: _themeGradientDecoration(),
                                child: appBarTab(_tabController),
                              ),
                            ),
                          ),
                        ];
                      },
                      body: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: TabBarView(
                            controller: _tabController,
                            children: tabs.map((e) {
                              return HomeTabList();
                            }).toList()),
                      ),
                    ))),
              ],
            );
          }),
          drawer: new SelfDrawer(), //抽屉
          floatingActionButton: Offstage(
            offstage: false,
            child: FloatingActionButton(
              onPressed: () {
                print('123123');
                //本打算监听_scrollController，当滑动距离较大时再显示"返回顶部"按钮，但实际发现在NestedScrollView头部被收起后就收不到监听了。
                //那么只能在TabBarView子页中监听它们自己的滚动距离，然后再通知到主页（可以用bloc发一个event、也可以发一个自定义Notification）显示"返回顶部"按钮。（嫌麻烦，不做了，永久显示吧）
                _scrollController.animateTo(1,
                    duration: Duration(seconds: 1), curve: Curves.decelerate);
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset('images/rocket.png'),
              ),
              mini: true,
              backgroundColor: Colors.blue,
            ),
          ),
        )
      ],
    );
  }

  Decoration _themeGradientDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 103, 114, 222),
        Color.fromARGB(255, 103, 116, 255),
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ));
  }

  ///头部标题栏
  Widget appBarHeader() {

    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Scaffold.of(innerContext).openDrawer();
            },
            child: Container(
              width: 34,
              height: 34,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
          Expanded(
            child: Hero(
                tag: 'searchBar',
                //hero的child中若有material系widget（如TextField），则父需要为Material系layout（如Scaffold、Material），否则在页面跳转期间会看到报错UI，提示祖先不是material
                child: Text(
                  '在东港',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "FZBIAOYSJW",
                      fontSize: 18,),
                )),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 12, right: 6),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///头部tab栏
  Widget appBarTab(TabController tabController) {
    return TabBar(
      isScrollable: true,
      controller: tabController,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.white,
      tabs: tabs.map((title) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontFamily: 'FZBIAOYSJW'),
          ),
        );
      }).toList(),
    );
  }
}
