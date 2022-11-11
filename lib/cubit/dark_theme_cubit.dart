import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dark_theme_state.dart';

class DarkThemeCubit extends Cubit<DarkThemeState> {
  DarkThemeCubit() : super(DarkThemeInitial());
  bool isdark = false;
  void themechanged() {
    isdark = !isdark;
    emit(DarkThemeLoaded());
  }
}
