import 'package:flutter/material.dart';
import 'package:flutter_application_11/bloc/selfa_bloc/selfa_bloc.dart';
import 'package:flutter_application_11/pages/selfa_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListSelfaUiProvider extends StatelessWidget {
  const ListSelfaUiProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelfaBloc(),
      child: const MyHomePage(),
    );
  }
}


