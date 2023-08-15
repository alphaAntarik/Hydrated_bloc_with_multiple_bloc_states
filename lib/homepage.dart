import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc using multiple state"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state is CounterIncrement) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("incremented"),
                  duration: Duration(microseconds: 200),
                ));
              } else if (state is CounterDecrement) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("decremented"),
                  duration: Duration(microseconds: 200),
                ));
              }
            },
            builder: (context, state) {
              return Text("Counter value ${state.count}");
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(DecreemntEvent());
                  },
                  child: Text("go previous")),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(IncreemntEvent());
                  },
                  child: Text("go further")),
            ],
          )
        ],
      ),
    );
  }
}
