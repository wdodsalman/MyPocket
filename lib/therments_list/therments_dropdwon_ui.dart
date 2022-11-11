import 'dart:ui';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/therments_list/therment_list.dart';

String? thermentsvalue;

class ThermentsDropdwonUi extends StatefulWidget {
  const ThermentsDropdwonUi({super.key});

  @override
  State<ThermentsDropdwonUi> createState() => _ThermentsDropdwonUiState();
}

class _ThermentsDropdwonUiState extends State<ThermentsDropdwonUi> {
  List<DropdownMenuItem> getItems() {
    List<DropdownMenuItem<String>> getDropItems = [];
    for (var i = 0; i < thermentslist.length; i++) {
      String ther = (thermentslist[i]);
      String ther2 = (thermentslistimage[i]);
      var NewItem = DropdownMenuItem(
        value: ther,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
          
            children: [
              CircleAvatar(
                radius: 10,
                child: Image.asset(ther2,) ,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(ther),

              const SizedBox(width: 30,)
            ],
          ),
        ),
      );
      getDropItems.add(NewItem);
    }
    return getDropItems;
  }

  @override
final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    var dropdownButtonFormField = Center(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Form(
          key: _formKey,
          child: Container(
            height: 55,
            width: double.infinity,
            color: Colors.white,
            child: DropdownButtonFormField(
                   validator: (depo) {
                      if (depo == null || depo.isEmpty) {
                        return ('رجاءا ادخل نوع المعاملة');
                      }
                      return null;
                    },
              borderRadius: BorderRadius.circular(15),
              dropdownColor: Colors.white,
              decoration: const InputDecoration(
               hintText: 'اختر نوع المعاملة', 
                  contentPadding: EdgeInsets.only(right: 10),
                  border: InputBorder.none),
              onChanged: ((value) {
                setState(() {
                  thermentsvalue = value;
                });
              }),
              items: getItems(),
            ),
          ),
        ),
      ),
    );
    return dropdownButtonFormField;
  }
}
