import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/counter_block.dart';
import 'package:flutter_application_1/features/counter_event.dart';
import 'package:flutter_application_1/features/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Counter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Conter App'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
        if (state is InitialState) {
          return _counter(context, 0);
        }
        if (state is UpdateState) {
          return _counter(context, state.counter);
        }
        return Container();
      }),
    );
  }

  Widget _counter(BuildContext context, counter) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {
                  context.read<CounterBloc>().add(NumberDecreaseEvent());
                },
                child: const Text(
                  '-',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36.0,
                  ),
                ),
              ),
              Text(counter.toString()),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  context.read<CounterBloc>().add(NumberIncreaseEvent());
                },
                child: const Text(
                  '+',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36.0,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
