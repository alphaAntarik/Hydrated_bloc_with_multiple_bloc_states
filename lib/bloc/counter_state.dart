// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'counter_bloc.dart';

class CounterState extends Equatable {
  int count;
  CounterState({required this.count});

  @override
  List<Object> get props => [count];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      count: map['count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));
}

class CounterIncrement extends CounterState {
  CounterIncrement(int count) : super(count: count);
}

class CounterDecrement extends CounterState {
  CounterDecrement(int count) : super(count: count);
}
