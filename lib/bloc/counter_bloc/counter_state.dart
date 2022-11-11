part of 'counter_bloc.dart';


 class CounterState   {
    int ? count;
  CounterState( this.count);

  
  List<Object> get props => [];

}



class CounterAddCount extends CounterState {
  CounterAddCount(int count) : super(0);
  
}

