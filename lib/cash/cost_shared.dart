import 'dart:convert';

import 'package:flutter_application_11/bloc/daily_them_bloc.dart';
import 'package:flutter_application_11/module/thermdaily.dart';
import 'package:flutter_application_11/pages/welcome_app.dart';
import 'package:flutter_application_11/tabs/drop_dwon.dart';
import 'package:flutter_application_11/therments_list/therment_list.dart';
import 'package:flutter_application_11/therments_list/therments_dropdwon_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CostShared {
  static addCurrency(String curr) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('CURRENCY', curr);
  }

  static addBalanceToSF(String balance) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('BALANCE', balance);
  }

  static addSalaryoSF(String salary) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('SALARY', salary);
  }

  // static getThermentList() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return json.decode(prefs.getString('key')??"");
  // }

  static removeThermentList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove('key');
  }

  static addthermentList(value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('key', json.encode(value));
  }

  static Future<String?> getCurrency() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(
      'CURRENCY',
    );
  }

  static Future<String?> getbalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(
      'BALANCE',
    );
  }

  static Future<String?> getISalary() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(
      'SALARY',
    );
  }

  static removeCurrency() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(
      'CURRENCY',
    );
  }

  static removeBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(
      'BALANCE',
    );
  }

  static removeSalary() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(
      'SALARY',
    );
  }

  static removeall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
