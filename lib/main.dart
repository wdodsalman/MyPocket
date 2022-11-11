import 'package:flutter/material.dart';
import 'package:flutter_application_11/app.dart';
import 'package:flutter_application_11/bloc/daily_them_bloc.dart';
import 'package:flutter_application_11/cash/cost_shared.dart';
import 'package:flutter_application_11/tabs/drop_dwon.dart';
import 'package:flutter_application_11/test_count.dart';
import 'compon/compon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rename/rename.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  var currencyname = await CostShared.getCurrency();
  print(currencyname);

  configLoading();
  runApp(
    await app(currency: currencyname.toString()),
  );
}
