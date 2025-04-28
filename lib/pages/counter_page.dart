import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void increment() => setState(() => counter++);
  void decrement() => setState(() => counter--);
  void reset() => setState(() => counter = 0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$counter', style: const TextStyle(fontSize: 48)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: decrement, icon: const Icon(Icons.remove)),
              IconButton(onPressed: reset, icon: const Icon(Icons.refresh)),
              IconButton(onPressed: increment, icon: const Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
