import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_11/app.dart';
import 'package:flutter_application_11/cash/cost_shared.dart';
import 'package:flutter_application_11/compon/compon.dart';
import 'package:flutter_application_11/module/thermdaily.dart';
import 'package:flutter_application_11/pages/main_page.dart';
import 'package:flutter_application_11/pages/navi_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_application_11/pages/welcome_app.dart';
import 'package:flutter_application_11/tabs/second_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/daily_them_bloc.dart';
import '../therments_list/therments_dropdwon_ui.dart';

class ThermentDayUi extends StatelessWidget {
  ThermentDayUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController thermentcontroller = TextEditingController();

    final fromkey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'المعاملات',
          ),
        ),
        body: BlocBuilder<DailyThemBloc, DailyThemState>(
          builder: (context, state) {
            return Form(
              key: fromkey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Textform(
                        hint: 'المبلغ',
                        fun: (value) {
                          if (value == null || value.isEmpty) {
                            return ('رجاءا ادخل المبلغ');
                          }
                        },
                        control: thermentcontroller),
                    const SizedBox(
                      height: 10,
                    ),
                    const ThermentsDropdwonUi(),
                    const SizedBox(
                      height: 25,
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.orange.shade100)),
                      onPressed: () async {
                        if (fromkey.currentState!.validate()) {
                          context.read<DailyThemBloc>().add(AddTherm(
                                Therment(
                                  cost: thermentcontroller.text,
                                  nametherment: thermentsvalue.toString(),
                                ),
                              ));
                          showSucess(context);
                          fromkey.currentState!.reset();
                          final String decode = Therment.encode([
                            Therment(
                                cost: thermentcontroller.text,
                                nametherment: thermentsvalue.toString())
                          ]);
                          await CostShared.addthermentList(decode);
                        }
                      },
                      child: const Text(
                        "اضافة معاملة",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}

showSucess(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => const AlertDialog(
            contentPadding: EdgeInsets.only(left: 70, top: 40, bottom: 40),
            backgroundColor: Colors.white,
            content: Text(
              'تم اضافة المعاملة ',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ));
}
