import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_11/main.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../pages/welcome_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

@override
class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => navigator());
  }

  void navigator() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const FirstScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(118, 255, 153, 0),
            Colors.orange.shade300,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'lib/assets/accounting.png',
            height: 75,
            width: 75,
          ),
         const SizedBox(height: 15,),
         const Text('يرجى الانتظار'),
         const SizedBox(height: 15,),
         CircularProgressIndicator(
          color: Colors.amber[50],
          backgroundColor: Colors.transparent,
         ),
         
        ],
      ),
    );
  }
}
