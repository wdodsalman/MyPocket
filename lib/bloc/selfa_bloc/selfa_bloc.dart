import 'package:bloc/bloc.dart';
import 'package:flutter_application_11/module/thermdaily.dart';
import 'package:meta/meta.dart';

part 'selfa_event.dart';
part 'selfa_state.dart';

List<SelfaThemer> selfathermlist = [];

class SelfaBloc extends Bloc<SelfaEvent, SelfaState> {
  SelfaBloc() : super(SelfaLoadedTherm(selfathermlist)) {
    on<Addselfatherm>(addSelfaTherm);
    on<RemoveSelfaTherm>(removelfaTherm);
  }

  addSelfaTherm(Addselfatherm event, emit) {
    selfathermlist.add(event.selfatherm);
    emit(SelfaLoadedTherm(selfathermlist));
  }

  removelfaTherm(RemoveSelfaTherm event, emit) {
    selfathermlist.remove(selfathermlist[event.index]);
    emit(SelfaLoadedTherm(selfathermlist));
  }
}
