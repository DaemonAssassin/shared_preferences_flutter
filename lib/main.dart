import 'package:flutter/material.dart';

import 'examples/cli/cli.dart';

void main(List<String> args) {
  runApp(const MyAppWidget());
}

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: const CLIWidget(),
    );
  }
}
