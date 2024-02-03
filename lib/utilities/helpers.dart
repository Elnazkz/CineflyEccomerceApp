import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/product_dto.dart';

class Helper {
  static void showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amberAccent,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  static List<ProductDto> search(String needle, List<ProductDto> hayStack) {
    return hayStack
        .where((item) => item.name.toLowerCase().contains(needle.toLowerCase()))
        .toList();
  }
}
