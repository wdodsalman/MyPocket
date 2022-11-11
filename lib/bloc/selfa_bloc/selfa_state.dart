part of 'selfa_bloc.dart';

@immutable
abstract class SelfaState {}

class SelfaInitial extends SelfaState {}

class SelfaLoadedTherm extends SelfaState {
  final List<SelfaThemer> selfathermlist;

  SelfaLoadedTherm(this.selfathermlist);
}

class SelfaError extends SelfaState {}
