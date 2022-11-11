import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/pages/welcome_app.dart';
import 'package:flutter_application_11/tabs/drop_dwon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_application_11/bloc/daily_them_bloc.dart';
import 'package:flutter_application_11/cash/cost_shared.dart';
import 'package:flutter_application_11/module/thermdaily.dart';
import 'package:flutter_application_11/splach/splach_screen.dart';

import 'cubit/dark_theme_cubit.dart';
import 'pages/navi_page.dart';

String? hello;
Future<Widget> app({ String ? currency}) async {
  var salarycost = await CostShared.getISalary() ;
  print(salarycost);
  var balancecost = await CostShared.getbalance() ;
  // String hello = await CostShared.getThermentList();
  // print(hello);

  print(balancecost);
  var salarycostandbalance =
      SalaryCost(salary: salarycost  , balance: balancecost , currencyname: currency );
  return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => DailyThemBloc(
                salarycostandbalance.balance ?? textToSend, salarycostandbalance.salary ?? textToSend2 , salarycostandbalance.currencyname.toString() )),
        BlocProvider(
          create: (context) => DarkThemeCubit(),
        )
      ],
      child: BlocConsumer<DarkThemeCubit, DarkThemeState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: BlocProvider.of<DarkThemeCubit>(context).isdark
              ? ThemeMode.dark
              : ThemeMode.light,
          darkTheme: ThemeData(
              fontFamily: '1arabic',
              appBarTheme: const AppBarTheme(
                  color: Colors.black,
                  toolbarTextStyle: TextStyle(color: Colors.white))),
          theme: ThemeData(
              fontFamily: '1arabic',
              appBarTheme: AppBarTheme(
                  color: Colors.orange[300],
                  toolbarTextStyle: const TextStyle(color: Colors.white))),
          home: salarycost == null
              ? const SplashScreen()
              : NaviPage(Currencyname: currency, thermentlistui: hello),
          builder: EasyLoading.init(),
        ),
      ));
}
