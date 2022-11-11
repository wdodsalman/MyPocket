import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_11/bloc/daily_them_bloc.dart';
import 'package:flutter_application_11/cash/cost_shared.dart';
import 'package:flutter_application_11/module/thermdaily.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoostBalance extends StatelessWidget {
  const BoostBalance({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController contro = TextEditingController();
    String u = contro.text;
    final _key = GlobalKey<FormState>();
    return BlocBuilder<DailyThemBloc, DailyThemState>(
      builder: (context, state) {
        return Form(
          key: _key,
          child: Scaffold(
            appBar:
                AppBar(centerTitle: true, title: const Text("تعزيز الرصيد")),
            body: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 50,
                        width: double.infinity,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: contro,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'رجاءا ادخل المبلغ ';
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'ادخل المبلغ ',
                            hintStyle: TextStyle(fontFamily: '1arabic'),
                            contentPadding: EdgeInsets.only(right: 15.0),
                            border: InputBorder.none,
                          ),
                        )),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(colors: [
                          Colors.white,
                          Colors.white54,
                        ]),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            context
                                .read<DailyThemBloc>()
                                .add(BostBalance(int.parse(contro.text)));
                            showBoostSucess(context);
                            _key.currentState!.reset();
                          }
                        },
                        child: const Text(
                          'اضافة',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

showBoostSucess(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => const AlertDialog(
            contentPadding: EdgeInsets.only(left: 70, top: 40, bottom: 40),
            backgroundColor: Colors.white,
            content: Text(
              'تم اضافة المبلغ ',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ));
}
