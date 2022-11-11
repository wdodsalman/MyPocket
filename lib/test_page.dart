import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_11/pages/welcome_app.dart';
import 'package:intl/intl.dart';



class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('lib/assets/image/1.png'),
        Image.asset('lib/assets/image/2.png'),
        Image.asset('lib/assets/image/3.png'),
        Image.asset('lib/assets/image/4.png'),
        Image.asset('lib/assets/image/5.png'),
        Image.asset('lib/assets/image/6.png'),
      ],
    );
  }
}
