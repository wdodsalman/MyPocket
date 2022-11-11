part of 'selfa_bloc.dart';

@immutable
abstract class SelfaEvent {}

class Addselfatherm extends SelfaEvent {
  final SelfaThemer selfatherm;

  Addselfatherm(this.selfatherm);
}

class RemoveSelfaTherm extends SelfaEvent {
  final int index;

  RemoveSelfaTherm(this.index);
}
