import 'package:flutter/material.dart';
import 'package:reactive/enum/appEnum.dart';
import 'package:reactive/other/constante.dart';
import 'package:reactive/page/about.dart';
import 'package:reactive/stream/app.stream.dart';



class Home extends StatelessWidget {
 String? a="Goto about";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Home'),
            Row(
              children: [
                TextButton(
                  child: Text("goto about 1"),
                  onPressed: () {
                    Constante.id=1;
                   AppStream.appSink.add(RouteEnum.About);
                  },
                ),
                TextButton(
                  child: Text("goto about 2"),
                  onPressed: () {
                    Constante.id=2;
                   AppStream.appSink.add(RouteEnum.About);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}