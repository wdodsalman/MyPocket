part of 'daily_them_bloc.dart';

abstract class DailyThemEvent {}

class AddTherm extends DailyThemEvent {
  final Therment therment;

  AddTherm(
    this.therment,
  );
}

class GetThermentList extends DailyThemEvent {}

class RemoveThement extends DailyThemEvent {
  final int index;

  RemoveThement(
    this.index,
  );
}

class DarkThemeToggle extends DailyThemEvent {
  final bool isdark;

  DarkThemeToggle(this.isdark);
}

class BostBalance extends DailyThemEvent {
  int boostBalance;

  BostBalance(this.boostBalance ,);
}
