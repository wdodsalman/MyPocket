import 'package:flutter/material.dart';
import 'package:flutter_application_11/pages/selfa_page.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/selfa_bloc/selfa_bloc.dart';

class SelfaListUi extends StatelessWidget {
  SelfaListUi(
      {super.key, this.date, this.costselfa, required this.nameforselfa});
  DateTime? date;

  String? costselfa;
  String nameforselfa;

  final formater = NumberFormat("#,##0.00", "en_US");
  final dateformater = DateFormat(' y / M / d');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelfaBloc(),
      child: BlocBuilder<SelfaBloc, SelfaState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('الاقساط'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(14.0),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: selfathermlist.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.blue.shade400, Colors.blueGrey]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 250.0),
                            child: IconButton(
                              icon: Image.asset(
                                'lib/assets/delete.png',
                                height: 75,
                                width: 75,
                              ),
                              onPressed: () {
                                context
                                    .read<SelfaBloc>()
                                    .add(RemoveSelfaTherm(index));
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(child: Text(selected)),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                formater.format(int.parse(
                                    selfathermlist[index].costofselfa)),
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'مبلغ السلفة',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dateformater
                                    .format(selfathermlist[index].dateforselfa),
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'تاريخ السلفة',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
