import 'package:flutter/material.dart';
import 'package:reactive/enum/appEnum.dart';
import 'package:reactive/other/constante.dart';
import 'package:reactive/stream/app.stream.dart';



class About extends StatelessWidget {
  const About({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('About ${Constante.id}'),
            TextButton(
              child: Text('Go to Profile'),
              onPressed: () {
                AppStream.appSink.add(RouteEnum.Home);
              },
            ),
          ],
        ),
      ),
    );
  }
}