import 'package:flutter/material.dart';
import 'package:flutter_app/page/my_page.dart';
import 'package:flutter_app/page/travel_page.dart';
import 'package:flutter_app/page/home_page.dart';
import 'package:flutter_app/page/service_page.dart';
import 'package:flutter_app/widget/self_drawer.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with SingleTickerProviderStateMixin {
  var _controller = PageController(initialPage: 0);
  final _defaultColor = Colors.grey;
  final _activeColor = Color.fromARGB(255,103,116,255);
  int _currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[HomeTabPage(), ServicePage(), TravelPage(), MyPage()],
        physics: NeverScrollableScrollPhysics(), //取消滑动
      ),
      drawer: new SelfDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.home,
              color: _activeColor,
            ),
            title: Text(
              '首页',
              style: TextStyle(
                  color: _currentIndex != 0 ? _defaultColor : _activeColor),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.cloud_circle,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.cloud_circle,
                color: _activeColor,
              ),
              title: Text(
                '服务',
                style: TextStyle(
                    color: _currentIndex != 1 ? _defaultColor : _activeColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.palette,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.palette,
                color: _activeColor,
              ),
              title: Text(
                '活动',
                style: TextStyle(
                    color: _currentIndex != 2 ? _defaultColor : _activeColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.supervisor_account,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.supervisor_account,
                color: _activeColor,
              ),
              title: Text(
                '社区',
                style: TextStyle(
                    color: _currentIndex != 3 ? _defaultColor : _activeColor),
              )),
        ],
      ),
    );
  }
}
