import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_11/module/thermdaily.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_11/bloc/daily_them_bloc.dart';
import '../bloc/daily_them_bloc.dart';

class ThermentsTab extends StatelessWidget {
  ThermentsTab({
    Key? key,
    required this.thermentlistui,
  }) : super(key: key);
  List<String>? listoftherments;
  final String? thermentlistui;

  @override
  Widget build(BuildContext context) {
    // List<Therment> list = Therment.decode(thermentlistui!);

    final format = NumberFormat("#,##0.00", "en -US");

    return themrment.isEmpty
        ? emptyPage()
        : Scaffold(
            body: BlocBuilder<DailyThemBloc, DailyThemState>(
              builder: (context, state) {
                if (state is LoadThermenetList) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                      itemCount: themrment.length,
                      itemBuilder: (context, index) => Container(
                        height: 150,
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.white30),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Colors.white10,
                                Colors.white12,
                              ])),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    context
                                        .read<DailyThemBloc>()
                                        .add(RemoveThement(index));
                                  },
                                  icon: const Icon(Icons.delete_outlined)),
                              Center(
                                child: Text(
                                  format
                                      .format(int.parse(themrment[index].cost)),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Text(
                                  themrment[index].nametherment,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return emptyPage();
              },
            ),
          );
  }
}

emptyPage() {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/wallet1.png',
              height: 80,
              width: 80,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'لاتوجد معاملات',
              style: TextStyle(fontSize: 15, color: Colors.black),
            )
          ],
        ),
      ),
    ),
  );
}
