import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget CustomGridView({List data = const [1, 2, 3, 4, 5]}) {
  if (data == null || data.length == 0) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey[300],
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        );
      },
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, childAspectRatio: 1.05),
    );
  }
  return SingleChildScrollView(

    padding: new EdgeInsets.all(4),
    scrollDirection: Axis.horizontal,
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: Iterable.generate(data.length, (index) {
            return GestureDetector(
              onTap: () {
                print('123');
              },
              child: Container(
                alignment: Alignment.center,
                width: 75,
                height: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.fiber_smart_record),
                    Text(
                      '投票',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black54, fontSize: 11.5),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    ),
  );
}
