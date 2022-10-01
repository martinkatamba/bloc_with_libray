import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(count: 0, lastState: "Add Or Subtract"));

  void increment() {
    final count = state.count + 1;
    emit(CounterState(count: count, lastState: "Adding..."));
  }

  void decrement() {
    final count = state.count - 1;
    emit(CounterState(count: count, lastState: "Subtracting.."));
  }

  void idle() {
    final count = state.count;
    emit(CounterState(count: count, lastState: "Add Or Subtract"));
  }
}
