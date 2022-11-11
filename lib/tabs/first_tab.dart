import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:flutter_application_11/bloc/daily_them_bloc.dart';
import 'package:flutter_application_11/compon/compon.dart';
import 'package:flutter_application_11/pages/welcome_app.dart';
import 'package:flutter_application_11/test_page.dart';
import 'package:flutter_application_11/therments_list/therment_list.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../module/thermdaily.dart';

class FirstTab extends StatelessWidget {
  FirstTab({Key? key, this.salary}) : super(key: key);

  final oCcy = new NumberFormat("#,##0.00", "en_US");

  final String? salary;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyThemBloc, DailyThemState>(
      builder: (context, state) {
        if (state is LoadThermenetList) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 95,
                    width: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(oCcy.format(state.minuBalance),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'رصيدك الحالي',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 95,
                    width: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(oCcy.format(state.salary),
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'الدخل الشهري ',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TreatmentDays()
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class TreatmentDays extends StatelessWidget {
  const TreatmentDays({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 10;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 5.0,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisExtent: 80.0),
        itemCount: choices.length,
        itemBuilder: (BuildContext context, int index) {
          return Gridvi(
            choic: choices[index],
          );
        },
      ),
    );
  }
}

class Gridvi extends StatelessWidget {
  const Gridvi({
    Key? key,
    required this.choic,
  }) : super(key: key);
  final Choice choic;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.circular(12),
        ),
        // height: 50,
        // width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              choic.title ?? '',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              choic.subtitle ?? '',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
