import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState( 0)) {
    on<Incrementcount>(addcount);
    on<Decrementcount>(removecount);
  }

  void addcount(Incrementcount event, emit) async {
    
    if (event is Incrementcount) {
      await emit(CounterState( state.count !+ 500));
    }
  }
  Future<dynamic> removecount(Decrementcount event, emit) async {
    if (event is Decrementcount) {
      await emit(CounterState( state.count !- 500));
    }
  }
}
