import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_11/app.dart';
import 'package:flutter_application_11/pages/boost_balance.dart';
import 'package:flutter_application_11/therments_list/therment_list.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';

import 'package:flutter_application_11/cash/cost_shared.dart';
import 'package:flutter_application_11/pages/navi_page.dart';
import 'package:flutter_application_11/pages/welcome_app.dart';

import '../cubit/dark_theme_cubit.dart';
import '../module/thermdaily.dart';

part 'daily_them_event.dart';
part 'daily_them_state.dart';

List<Therment> themrment = [];
List<BoostCost> boostcost = [];

class DailyThemBloc extends Bloc<DailyThemEvent, DailyThemState> {
  final String balancecost;
  final String salarycost;
  final String currencyname;
  DailyThemBloc(this.balancecost, this.salarycost, this.currencyname)
      : super(
          LoadThermenetList(
              themrment,
              int.parse(
                balancecost,
                onError: (source) {
                  return int.parse(textToSend);
                },
              ),
              int.parse(
                salarycost,
                onError: (source) {
                  return int.parse(textToSend);
                },
              ),
              currencyname,
              boostcost),
        ) {
    on<AddTherm>(addTherment);
    on<GetThermentList>(getThermentList);
    on<RemoveThement>(removeTherment);
    on<DarkThemeToggle>(isDark);
    on<BostBalance>(bostbalance);
  }

  void addTherment(AddTherm event, emit) async {
    var newsalary = int.parse((await CostShared.getISalary())!);

    // var newlist = await CostShared.getThermentList();
    // List<Therment> list = Therment.decode(newlist);

    // list.add(event.therment);
    // String encoded = jsonEncode(list);

    // await CostShared.addthermentList(encoded.toString());
    var newbalance = int.parse((await CostShared.getbalance())!) -
        int.parse(event.therment.cost);

    var newcurrencyname = await CostShared.getCurrency();
    await CostShared.addCurrency(newcurrencyname.toString());
    await CostShared.addBalanceToSF(newbalance.toString());
    await CostShared.addSalaryoSF(newsalary.toString());

    themrment.add(
      event.therment,
    );

    emit(LoadThermenetList(themrment, newbalance, newsalary,
        newcurrencyname.toString(), boostcost));
  }

  void getThermentList(GetThermentList event, emit) async {
    var newsalary = int.parse((await CostShared.getISalary())!);
    var newbalance = int.parse((await CostShared.getbalance())!);
    var newcurrencyname = await CostShared.getCurrency();
    await CostShared.addCurrency(newcurrencyname.toString());

    await CostShared.addBalanceToSF(newbalance.toString());
    await CostShared.addSalaryoSF(newsalary.toString());

    emit(LoadThermenetList(themrment, newbalance, newsalary,
        newcurrencyname.toString(), boostcost));
  }

  void removeTherment(
    RemoveThement event,
    emit,
  ) async {
    var newsalary = int.parse((await CostShared.getISalary())!);

    var newbalance = int.parse((await CostShared.getbalance())!);

    var cost = themrment[event.index].cost;
    newbalance = newbalance + int.parse(cost);

    themrment.remove(themrment[event.index]);

    await CostShared.addSalaryoSF(newsalary.toString());
    await CostShared.addBalanceToSF(newbalance.toString());
    var newcurrencyname = await CostShared.getCurrency();
    await CostShared.addCurrency(newcurrencyname.toString());
    emit(LoadThermenetList(themrment, newbalance, newsalary,
        newcurrencyname.toString(), boostcost));
  }

  void isDark(DarkThemeToggle event, emit) {
    bool isdark = false;
    isdark = !isdark;
    emit(DarkThemeChanged(event.isdark));
  }

  void bostbalance(BostBalance event, emit) async {
    event.boostBalance;

    var newsalary = int.parse((await CostShared.getISalary())!);

    var newbalance = int.parse((await CostShared.getbalance())!);
    newbalance = newbalance + event.boostBalance;
    var newcurrencyname = await CostShared.getCurrency();
    await CostShared.addCurrency(newcurrencyname.toString());

    await CostShared.addCurrency(newcurrencyname.toString());
    await CostShared.addBalanceToSF(newbalance.toString());
    await CostShared.addSalaryoSF(newsalary.toString());
    emit(LoadThermenetList(themrment, newbalance, newsalary,
        newcurrencyname.toString(), boostcost));
  }
}
