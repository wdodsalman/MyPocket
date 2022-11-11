import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class NaviCubit extends Cubit<int> {
  NaviCubit() : super(0);
  int currentindex = 0;
  void changenavi(int index) => emit(index);
}
