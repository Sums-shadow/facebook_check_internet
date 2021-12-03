
import 'dart:io';

class Constante{


  static int? id;
static bool? iscon=false;

  static Future<bool> checkInternetConnection() async {
  //kindacode
  try {
    final response = await InternetAddress.lookup('www.kindacode.com');
    // print(response);
    if (response.isNotEmpty) {
      return true;
    }
  } on SocketException catch (err) {
    // print(err);
    return false;
  }
  return false;
}
}