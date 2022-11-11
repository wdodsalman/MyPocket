import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/cash/cost_shared.dart';
import 'package:flutter_application_11/pages/main_page.dart';
import 'package:flutter_application_11/pages/navi_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../compon/compon.dart';
import '../tabs/drop_dwon.dart';
import 'package:intl/intl.dart' as intl;

TextEditingController controller = TextEditingController();
TextEditingController controller2 = TextEditingController();
String textToSend = controller.text;
String textToSend2 = controller2.text;
final _formKey = GlobalKey<FormState>();
Timer? _timer;

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    super.key,
  });

  Navigato(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const  NaviPage(thermentlistui: '',)),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text('اعداد التطبيق لاول مرة ',
            style: TextStyle(
              fontFamily: '1arabic',
              color: Colors.black,
              fontSize: 25.0,
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const DropDwon(),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    validator: (depo) {
                      if (depo == null || depo.isEmpty) {
                        return ('رجاءا ادخل رصيدك الحالي');
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'ادخل رصيدك الحالي ',
                      hintStyle: TextStyle(fontFamily: '1arabic'),
                      contentPadding: EdgeInsets.only(right: 10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.number,
                    controller: controller2,
                    validator: (salary) {
                      if (salary == null || salary.isEmpty) {
                        return ('رجاءا ادخل راتبك ');
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'ادخل راتبك الشهري ',
                      hintStyle: TextStyle(fontFamily: '1arabic'),
                      contentPadding: EdgeInsets.only(right: 10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                OutlinedButton(
                  onPressed: (() async {
                    _timer?.cancel();
                    await EasyLoading.show(status: 'يرجى الانتظار');
                    EasyLoading.dismiss(animation: true);

                    if (_formKey.currentState!.validate()) {
                      Navigato(context);
                    }
                    await CostShared.addCurrency(Currencyselected.toString());
                    await CostShared.addBalanceToSF(controller.text);
                    await CostShared.addSalaryoSF(controller2.text);
                  }),
                  child: const Text(
                    'تم',
                    style:
                        TextStyle(color: Colors.black, fontFamily: '1arabic'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
