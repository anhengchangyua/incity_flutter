import 'package:flutter/material.dart';

Widget HomeListItem() {
  return SliverList(
    delegate: SliverChildBuilderDelegate((context, index) {
      return ListItem();
    }, childCount: 21),
  );
}

class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem>
    with SingleTickerProviderStateMixin {
  AnimationController _collectController;
  Animation _collectAnim;

  @override
  void initState() {
    super.initState();
    _collectController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _collectController, curve: Curves.easeOut);
    _collectAnim = Tween<double>(begin: 1, end: 1.8).animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }

  @override
  void dispose() {
    _collectController?.dispose();
    super.dispose();
  }
}
