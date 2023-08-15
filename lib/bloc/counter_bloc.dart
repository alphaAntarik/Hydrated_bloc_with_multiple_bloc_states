import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<IncreemntEvent>((event, emit) {
      emit(CounterIncrement(state.count + 1));
    });
    on<DecreemntEvent>((event, emit) {
      emit(CounterDecrement(state.count - 1));
    });
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState(count: json['count']);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    // TODO: implement toJson
    return state.toMap();
  }
}
