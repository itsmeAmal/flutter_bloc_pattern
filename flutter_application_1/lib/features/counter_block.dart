import 'package:flutter_application_1/features/counter_event.dart';
import 'package:flutter_application_1/features/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterBloc() : super(InitialState()) {
    on<NumberIncreaseEvent>(OnNumberIncrease);
    on<NumberDecreaseEvent>(OnNumberDecrease);
  }

  void OnNumberIncrease(NumberIncreaseEvent event, Emitter<CounterState> emitter) {
    counter = counter + 1;
    emitter(UpdateState(counter));
  }

  void OnNumberDecrease(NumberDecreaseEvent event, Emitter<CounterState> emitter) {
    counter = counter - 1;
    emitter(UpdateState(counter));
  }
}
