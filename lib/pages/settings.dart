import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_application_11/bloc/daily_them_bloc.dart';
import 'package:flutter_application_11/cash/cost_shared.dart';
import 'package:flutter_application_11/pages/boost_balance.dart';
import 'package:flutter_application_11/pages/selfa_listUiProvider.dart';
import 'package:flutter_application_11/pages/selfa_page.dart';

import '../cubit/dark_theme_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('الاعدادت'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListSelfaUiProvider(),
                    ));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.darken,
                    color: Colors.transparent,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Image.asset('lib/assets/wallet.png'),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text('السلف والاقساط'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BoostBalance(),
                    ));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    backgroundBlendMode: BlendMode.darken,
                    color: Colors.transparent,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Image.asset('lib/assets/money.png'),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text('تعزيز رصيدك'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
