import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Contain({
  double wid = double.infinity,
  double r = 10.0,
  required String text,
  required String text2,
  bool isUpper = true,
  Color back = Colors.white,
  double dob = 13.5,
}) =>
    Container(
      padding: EdgeInsets.only(right: 25),
      width: 75,
      height: 75,
      color: back,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: dob),
          ),
          const SizedBox(height: 10),
          Text(
            text2,
            style: TextStyle(fontSize: dob),
          )
        ],
      ),
    );

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class Choice {
  const Choice({this.title, this.subtitle});
  final String? title;
  final String? subtitle;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'اليوم', subtitle: '0.0'),
  Choice(title: 'أمس', subtitle: '0.0'),
  Choice(title: 'الاسبوع الحالي ', subtitle: '0.0'),
  Choice(title: 'الاسبوع السابق', subtitle: '0.0'),
  Choice(title: 'الشهر السابق', subtitle: '0.0'),
  Choice(title: 'الشهر الحالي', subtitle: '0.0'),
];
Textform({
  required String? Function(String?) fun,
  required TextEditingController control,
  required String? hint,
}) =>
    Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 55,
      width: double.infinity,
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: fun,
        controller: control,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.only(right: 10.0),
          border: InputBorder.none,
        ),
      ),
    );

// selectedButton({required String tex, required VoidCallback fun}) =>
// Wrap(children: [
//   nameforselfa.map((nameforselfa) => GestureDetector(
//     onTap: fun,
//     child: Container(
//       height: 75,
//       width: 100,
//       decoration: BoxDecoration(
//         border: Border.all(),
//         color: isSelected ? Color(0xff4aa3f8) : Color(0xff3a327f),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Center(child: Text(tex)),
//     ),
//   ),)

// ]);



class NameforSelfa {
  final String name;

  NameforSelfa({
    required this.name,
 
  });
}
