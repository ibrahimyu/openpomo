import 'package:flutter/material.dart';

class CounterBox extends StatelessWidget {
  final String title;
  final String value;
  const CounterBox({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
