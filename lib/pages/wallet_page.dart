import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_11/bloc/daily_them_bloc.dart';
import 'package:flutter_application_11/pages/welcome_app.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final oCcy = NumberFormat("#,##0.00", "en_US");

    return BlocBuilder<DailyThemBloc, DailyThemState>(
      builder: (context, state) {
        if (state is LoadThermenetList) {
          return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'المحفظات',
                ),
                centerTitle: true,
              ),
              body: Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Container(
                              height: 185,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.purple,
                                        Colors.purpleAccent.shade100,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(25)),
                              child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: AssetImage(
                                                  'lib/assets/money.png'),
                                              maxRadius: 15,
                                              minRadius: 10,
                                            ),
                                            Text('مصروف الشهر ',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                oCcy.format(
                                                    state.minuBalance),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin:
                                                const EdgeInsets.only(right: 5),
                                            child: const Text(
                                              'الرصيد المتاح',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            )),
                                      ])))),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Container(
                              height: 185,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.redAccent.withAlpha(25),
                                        Colors.purpleAccent.shade200,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(25)),
                              child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: AssetImage(
                                                  'lib/assets/wallet.png'),
                                              maxRadius: 15,
                                              minRadius: 10,
                                            ),
                                            Text(' حساب بنكي',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(oCcy.format(state.salary),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                            margin:
                                                const EdgeInsets.only(right: 5),
                                            child: const Text(
                                              'الرصيد المتاح',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            )),
                                      ])))),
                    ],
                  ),
                ),
              ]));
        }
        return Container();
      },
    );
  }
}
