import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_11/compon/compon.dart';
import 'package:flutter_application_11/module/thermdaily.dart';
import 'package:flutter_application_11/pages/selfa_ui_list.dart';
import 'package:flutter_application_11/pages/toogle_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/selfa_bloc/selfa_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectdifreentDate(BuildContext context) async {
    final DateTime? picked2 = await showDatePicker(
        textDirection: TextDirection.rtl,
        confirmText: 'تم ',
        cancelText: 'الغاء',
        fieldLabelText: "اختر التاريخ ",
        helpText: "اختر التاريخ ",
        context: context,
        initialDate: selectedDate2,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked2 != null) {
      setState(() {
        selectedDate2 = picked2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controllselfa = TextEditingController();
    final selfakey = GlobalKey<FormState>();
    dynamic selected;
    return Scaffold(
      appBar: AppBar(
        title: const Text('السلف والاقساط'),
        centerTitle: true,
      ),
      body: BlocBuilder<SelfaBloc, SelfaState>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: selfakey,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(),
                        ),
                        child: Textform(
                            control: controllselfa,
                            fun: (value) {
                              if (value == null || value.isEmpty) {
                                return 'رجاءا ادخل المبلغ ';
                              }
                              return null;
                            },
                            hint: 'ادخل مبلغ القسط ')),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'تاريخ بدء السلفة ',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: (() => _selectdifreentDate(context)),
                      child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(Icons.date_range),
                                const SizedBox(
                                  width: 150,
                                ),
                                Text(
                                    "${selectedDate2.toLocal()}".split(' ')[0]),
                              ],
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(child: DropDwonSelfa()),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                        child: OutlinedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.orange.shade100)),
                            onPressed: (() {
                              if (selfakey.currentState!.validate()) {
                                context.read<SelfaBloc>().add(Addselfatherm(
                                    SelfaThemer(
                                        controllselfa.text, selectedDate2)));
                                print(selectedDate2);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelfaListUi(
                                          nameforselfa:
                                              selected ?? 'سلفة شخصية',
                                          costselfa: controllselfa.text,
                                          date: selectedDate),
                                    ));
                              }
                            }),
                            child: const Text(
                              'تم',
                              style: TextStyle(color: Colors.black),
                            )))
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

List<String> item = [
  'سلفة شخصية ',
  'سلفة حكومية ',
  'قروض شخصية ',
  'قروض حكومية ',
];
dynamic selected;

class DropDwonSelfa extends StatefulWidget {
  const DropDwonSelfa({
    super.key,
  });

  @override
  State<DropDwonSelfa> createState() => _DropDwonSelfaState();
}

class _DropDwonSelfaState extends State<DropDwonSelfa> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton(
          iconEnabledColor: Colors.transparent,
          isExpanded: true,
          borderRadius: BorderRadius.circular(10),
          iconDisabledColor: Colors.transparent,
          alignment: AlignmentDirectional.bottomCenter,
          underline:const  DropdownButtonHideUnderline(child: SizedBox()),
          elevation: 0,
          value: selected,
          hint: Text(selected ?? 'اختر نوع المعاملة '),
          items: item.map((String items) {
            return DropdownMenuItem(
              alignment: AlignmentDirectional.center,
              value: items, child: Text(items));
          }).toList(),
          onChanged: (value) {
            setState(() {
              selected = value;
            });
          },
        ),
      ),
    );
  }
}
