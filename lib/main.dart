import 'dart:async';
import 'dart:io';

import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:reactive/enum/appEnum.dart';
import 'package:reactive/page/about.dart';
import 'package:reactive/page/home.dart';
import 'package:reactive/stream/app.stream.dart';

import 'other/constante.dart';

void main() {
  // Create ping object with desired args
  final ping = Ping('google.com');

  // Begin ping process and listen for output
  bool isconnect = false;
  // ping.stream.listen((event) {
  //   isconnect=event.error==null;
  //   AppStream.dataSink.add(event.error==null?DataEnum.connected:DataEnum.noconnected);
  //   Constante.iscon=event.error==null;
  //   // print(Constante.iscon);
  //   // print("${event.error}------ ${event.response}------ ${event.summary}");
  // });
  runApp(MyApp()
//     StreamBuilder<PingData>(
//       stream: ping.stream,
//       builder: (context, snap){
//       if(snap.hasData){
//           PingData dt=snap.data!;
//         print(dt.error==null);
// return dt.error==null?:MyApp2();
//       }
//       return CircularProgressIndicator();
//     })
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Debut(),
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("OOKKK"),
        ),
      ),
    );
  }
}

class Debut extends StatefulWidget {
  const Debut({Key? key}) : super(key: key);

  @override
  _DebutState createState() => _DebutState();
}

class _DebutState extends State<Debut> {
  final ping = Ping('google.com');
  bool show = false;
  BuildContext? ctxx;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ping.stream.listen((event) {
      PingData e = event;
      print(show);
      setState(() {
        if (e.error != null) {
          if (show == false)
            showDialog(
              context: context, // <<----
              barrierDismissible: false,
              builder: (BuildContext ctx) {
                // dialogContext = context;
                ctxx = ctx;
                return Dialog(
                  child: Text("Vous n'êtes pas connecté"),
                );
              },
            );
          show = true;
        } else {
          try {
            if (show == true) Navigator.pop(ctxx!);
          } catch (e) {
            print("o sambwe");
          }
          show = false;
        }
      });
    });
    // AppStream.dataStream.listen((event) {
    //   print(event);
    //  });
    //  checkInternet();
  }

  checkInternet() {
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      Constante.checkInternetConnection().then((val) => print(val));
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RouteEnum>(
        stream: AppStream.appStream,
        builder: (context, snap) {
          switch (snap.data) {
            case RouteEnum.Home:
              return Home();
            case RouteEnum.About:
              return About();
            default:
              return CircularProgressIndicator();
          }
        });
  }
}
