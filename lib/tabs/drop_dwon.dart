import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_application_11/currency_list/currency.dart';
import 'package:flutter_application_11/pages/main_page.dart';

String? Currencyselected;

class DropDwon extends StatefulWidget {
  const DropDwon({super.key});

  @override
  State<DropDwon> createState() => _DropDwonState();
}

class _DropDwonState extends State<DropDwon> {
  List<DropdownMenuItem> getItems() {
    List<DropdownMenuItem<String>> getDropItems = [];
    for (var i = 0; i < Currency.length; i++) {
      String cur = (Currency[i]);
      String cur2 = (Currency2[i]);
      var NewItem = DropdownMenuItem(
        value: cur,
        child: Stack(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Image.asset(
                cur2,
                height: 25.5,
                width: 25.5,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(cur),
            ],
          ),
        ]),
      );
      getDropItems.add(NewItem);
    }
    return getDropItems;
  }

  @override
  Widget build(BuildContext context) {
    @override
    var dropdownButtonFormField = DropdownButtonFormField(
      dropdownColor: Colors.white,
      hint: const Text("اختر نوع العملة "),
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.0),
          ),
          border: OutlineInputBorder()),
      onChanged: ((value) {
        setState(() {
          Currencyselected = value;
        });
      }),
      items: getItems(),
    );
    return dropdownButtonFormField;
  }
}
