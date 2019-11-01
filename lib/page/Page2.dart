import 'package:flutter/material.dart';
import 'package:flutter_app/provider/CounterNotifier.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rebuild page 2');
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: Center(
        child: Consumer2<CounterNotifier, int>(
            builder: (context, counter, size, _) {
              print('rebuild page 2 refresh count');

              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${counter.count}',
                    style: TextStyle(
                      fontSize: size.toDouble(),
                    ),
                  ),
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 不需要监听改变（listen: false 不会重新调用build）
          Provider.of<CounterNotifier>(context, listen: false).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}