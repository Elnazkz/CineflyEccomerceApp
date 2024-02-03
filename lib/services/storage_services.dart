import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StorageUtils {

  //Wasn't sure whether to use dynamic or Object
  // static Future<Object?> loadJsonAsset(String jsonPath) async {
  //   final String jsonString = await rootBundle.loadString(jsonPath);
  //   final data = jsonDecode(jsonString);
  //   return data;
  // }

  static Future<dynamic> loadJsonAsset(String jsonPath) async {
    final String jsonString = await rootBundle.loadString(jsonPath);
    final data = jsonDecode(jsonString);
    return data;
  }

  static Future<SharedPreferences> loadSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

}
