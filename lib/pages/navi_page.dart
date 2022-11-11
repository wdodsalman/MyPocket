import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_11/bloc/daily_them_bloc.dart';
import 'package:flutter_application_11/cubit/navi_cubit.dart';
import 'package:flutter_application_11/pages/settings.dart';
import 'package:flutter_application_11/pages/wallet_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../compon/compon.dart';
import 'ThermentDayUi.dart';
import 'main_page.dart';

class NaviPage extends StatelessWidget {
  const NaviPage({
    super.key,
    this.Currencyname,
    required this.thermentlistui
  });
  final String? Currencyname;
  final String ?thermentlistui;

  @override
  Widget build(BuildContext context) {
    final FormdKey = GlobalKey<FormState>();
    final TextEditingController DailyContro = TextEditingController();

    return BlocProvider(
      create: (context) => NaviCubit(),
      child: BlocBuilder<NaviCubit, int>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              bottomNavigationBar: bottomnavi(context, state),
              body: IndexedStack(
                index: state,
                children: [
                  MainPage(
                    tabSelected: 1,
                    currencyname: Currencyname,
                    thermentlistui: thermentlistui,
                  ),
                  ThermentDayUi(),
                  const WalletPage(),
                  const SettingsPage(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget bottomnavi(BuildContext context, int currentindex) {
  return BottomNavigationBar(
      iconSize: 18,
      unselectedFontSize: 10,
      selectedFontSize: 12,
      showSelectedLabels: true,
      currentIndex: currentindex,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(color: Colors.black),
      showUnselectedLabels: true,
      onTap: (int index) {
        context.read<NaviCubit>().changenavi(index);
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled), label: 'الرئيسية'),
        BottomNavigationBarItem(
            icon: Icon(Icons.cases_rounded), label: 'اضافة معاملة  '),
        BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'المحفظات '),
        BottomNavigationBarItem(
            icon: Icon(Icons.output_outlined), label: 'المزيد'),
      ]);
}
