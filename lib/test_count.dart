import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc/counter_bloc.dart';

class TestProvider extends StatelessWidget {
  const TestProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: TestCount(),
    );
  }
}

class TestCount extends StatelessWidget {
  const TestCount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'Test',
              style: TextStyle(color: Colors.black),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(top:700),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                FloatingActionButton(
                  child: const  Icon(Icons.remove),
                  onPressed: () => context.read<CounterBloc>().add(Decrementcount()),
                ),
                FloatingActionButton(
                  child:const  Icon(Icons.add),
                  onPressed: () => context.read<CounterBloc>().add(Incrementcount()),
                ),
              ],
            ),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IconButton(onPressed: (() => context.read<CounterBloc>().add(Incrementcount())), icon: const Icon(Icons.plus_one )),
                Text(
                  'Count${state.count.toString()}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                // IconButton(onPressed: (() => context.read<CounterBloc>().add(Decrementcount())), icon: const Icon(Icons.exposure_minus_1_rounded)),
              ],
            ),
          ),
        );
      },
    );
  }
}
