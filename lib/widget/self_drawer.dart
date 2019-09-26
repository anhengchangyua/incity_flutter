import 'package:flutter/material.dart';

class SelfDrawer extends StatelessWidget {
  const SelfDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/drawer_bg.jpeg'),
                          fit: BoxFit.fill,
                          alignment: Alignment.center)),
                  alignment: Alignment.center,
                ),
                Center(
                  child: Container(
                    child: Text(
                      '个人中心',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 48.0),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('信息完善'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('关于我们'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('退出'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
