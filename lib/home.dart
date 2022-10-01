import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';
import 'cubit/counter_state.dart';

class Home extends StatelessWidget {
  final String title;
  const Home({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${state.lastState}',
                ),
                Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              final cubit = context.read<CounterCubit>();
              cubit.increment();
              Future.delayed(Duration(seconds: 1), () {
                print("Executed after 1 second");
                cubit.idle();
              });
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              final cubit = context.read<CounterCubit>();
              cubit.decrement();
              Future.delayed(Duration(seconds: 1), () {
                print("Executed after 1 second");
                cubit.idle();
              });
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
