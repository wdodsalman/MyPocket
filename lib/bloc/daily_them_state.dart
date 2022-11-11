part of 'daily_them_bloc.dart';

class DailyThemState {
  List<Object> get props => [];
}

class DailyThemInitial extends DailyThemState {}

class DailyThemLoading extends DailyThemState {}

class LoadThermenetList extends DailyThemState {
  final List<Therment> thermentlist;
  final List<BoostCost> boostlist;

  LoadThermenetList(
      this.thermentlist, this.minuBalance, this.salary, this.currencyname , this.boostlist);
  final int? minuBalance;
  final int? salary;

  final String currencyname;
}

class DailyThemError extends DailyThemState {
  final String msg;
  DailyThemError({
    required this.msg,
  });
}

class DarkThemeChanged extends DailyThemState {
  final bool isdark;

  DarkThemeChanged(this.isdark);
}

class boost extends DailyThemState {
  final int contro;

  boost(this.contro);
}
