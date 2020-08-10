import 'dart:convert';

import 'package:rahyab/model/WorkModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper
{
  static Future<void> setPref(name, pref) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(name, pref);
  }

  static Future<String> getPref(name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(name);
  }




  static Future<void> userMobileSet(pref) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userMobile', pref);
  }
  static Future<String> userMobileGet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userMobile');
  }




  static Future<List<WorkModel>> getWorkGroup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var s =  prefs.getString('workGroup');
    List<WorkModel> l = List<WorkModel>();
    for(var i in jsonDecode(s))
    {
      print(i);
      l.add(WorkModel.fromJson(i));
    }
    return l;
  }
  static Future<String> setWorkGroup(t) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('workGroup' , jsonEncode(t));
  }
}