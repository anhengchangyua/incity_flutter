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
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "个人中心",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 48.0),
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
            )),
          ],
        ),
      ),
    );
  }
}
