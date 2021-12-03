


import 'package:reactive/enum/appEnum.dart';
import 'package:rxdart/rxdart.dart';

class AppStream{


  static BehaviorSubject<RouteEnum> _routeStream = BehaviorSubject.seeded(RouteEnum.Home);
  static Stream<RouteEnum> get appStream => _routeStream.stream; //ecouter
  static Sink<RouteEnum> get appSink => _routeStream.sink; //emettre


  //CONNECTION INTERNET
  static BehaviorSubject<DataEnum> _dataStream = BehaviorSubject.seeded(DataEnum.noconnected);
  static Stream<DataEnum> get dataStream => _dataStream.stream; //ecouter
  static Sink<DataEnum> get dataSink => _dataStream.sink; //emettre
}