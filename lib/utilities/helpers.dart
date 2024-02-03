import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Helper {

  static void showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amberAccent,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }

}
