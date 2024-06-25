//!data_connection_checker_tv
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> checkConnection() async {
  bool result = await DataConnectionChecker().hasConnection;
  return result;
}

showToust(
    {required String message,
    required Color textcolor,
    required Color backgroundclr}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundclr,
      textColor: textcolor,
      fontSize: 16.0);
}
