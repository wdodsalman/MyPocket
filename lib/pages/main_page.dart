import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_11/bloc/daily_them_bloc.dart';
import 'package:flutter_application_11/cash/cost_shared.dart';
import 'package:flutter_application_11/cubit/dark_theme_cubit.dart';
import 'package:flutter_application_11/currency_list/currency.dart';
import 'package:flutter_application_11/splach/splach_screen.dart';
import 'package:flutter_application_11/tabs/drop_dwon.dart';
import '../module/thermdaily.dart';
import '../tabs/first_tab.dart';
import '../tabs/second_tab.dart';
import '../tabs/therment_tabs.dart';
import 'welcome_app.dart';
import '../tabs/drop_dwon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  MainPage(
      {super.key,
      required this.tabSelected,
      this.currencyname,
      required this.thermentlistui});
  final String? thermentlistui;

  String? currencyname;
  int tabSelected;

  TabController? _controller;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkThemeCubit, DarkThemeState>(
        builder: (context, state) {
      return SafeArea(
        child: DefaultTabController(
          initialIndex: tabSelected,
          length: 3,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).padding.left.toDouble()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (currencyname == null)
                            Text(
                              Currencyselected.toString(),
                              style: const TextStyle(
                                  fontSize: 15, fontFamily: '1arabic'),
                            )
                          else
                            Text(currencyname.toString(),
                                style: const TextStyle(fontSize: 15)),
                          const SizedBox(
                            width: 190,
                          ),
                          IconButton(
                            icon: BlocProvider.of<DarkThemeCubit>(context)
                                    .isdark
                                ? const Icon(Icons.wb_incandescent)
                                : const Icon(Icons.wb_incandescent_outlined),
                            onPressed: () {
                              context.read<DarkThemeCubit>().themechanged();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                  bottom: TabBar(
                      controller: _controller,
                      indicatorColor: Colors.cyan,
                      tabs: const [
                        Tab(
                          child: Text('المعاملات'),
                        ),
                        Tab(
                          child: Text('الاحصائيات'),
                        ),
                        Tab(
                          child: Text('النماذج'),
                        ),
                      ]),
                ),
                body: TabBarView(
                  controller: _controller,
                  physics: const BouncingScrollPhysics(),
                  dragStartBehavior: DragStartBehavior.down,
                  children: [
                    ThermentsTab(thermentlistui: thermentlistui),
                    FirstTab(),
                    const ThemernetTab(),
                  ],
                )),
          ),
        ),
      );
    });
  }
}
