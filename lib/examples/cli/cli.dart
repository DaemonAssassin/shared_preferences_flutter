// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CLIWidget extends StatefulWidget {
  const CLIWidget({Key? key}) : super(key: key);

  @override
  State<CLIWidget> createState() => _CLIWidgetState();
}

class _CLIWidgetState extends State<CLIWidget> {
  StringBuffer data = StringBuffer('');
  int intNumber = 100;
  double doubleNumber = 44.44;
  String name = 'Mateen';
  bool isAvailable = true;
  List<String> stringList = ['mateen', 'mubeen', 'zain'];

  @override
  void initState() {
    super.initState();
    getDataFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data.toString()),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    addInt();
                  },
                  child: const Text('Add Int'),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteInt();
                  },
                  child: const Text('Remove Int'),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    addDouble();
                  },
                  child: const Text('Add Double'),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteDouble();
                  },
                  child: const Text('Remove Double'),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    addString();
                  },
                  child: const Text('Add String'),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteString();
                  },
                  child: const Text('Remove String'),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    addBool();
                  },
                  child: const Text('Add Bool'),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteBool();
                  },
                  child: const Text('Remove Bool'),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    addStringList();
                  },
                  child: const Text('Add StringList'),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteStringList();
                  },
                  child: const Text('Remove StringList'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addInt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('int')) {
      prefs.setInt('int', intNumber);
    } else {
      print('Already has value with this key');
    }
  }

  void addDouble() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('double')) {
      prefs.setDouble('double', doubleNumber);
    } else {
      print('Already has value with this key');
    }
  }

  void addBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('bool')) {
      prefs.setBool('bool', isAvailable);
    } else {
      print('Already has value with this key');
    }
  }

  void addString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('string')) {
      prefs.setString('string', name);
    } else {
      print('Already has value with this key');
    }
  }

  void addStringList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('stringList')) {
      prefs.setStringList('stringList', stringList);
    } else {
      print('Already has value with this key');
    }
  }

  void deleteInt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('int')) {
      prefs.remove('int');
    } else {
      print('Don\'t have a value with this key');
    }
  }

  void deleteDouble() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('double')) {
      prefs.remove('double');
    } else {
      print('Don\'t have a value with this key');
    }
  }

  void deleteBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('bool')) {
      prefs.remove('bool');
    } else {
      print('Don\'t have a value with this key');
    }
  }

  void deleteString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('string')) {
      prefs.remove('string');
    } else {
      print('Don\'t have a value with this key');
    }
  }

  void deleteStringList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('stringList')) {
      prefs.remove('stringList');
    } else {
      print('Don\'t have a value with this key');
    }
  }

  void getDataFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    data.writeln('int: ${prefs.getInt('int') ?? 0}');
    data.writeln('double: ${prefs.getDouble('double') ?? 0.0}');
    data.writeln('bool: ${prefs.getBool('bool') ?? false}');
    data.writeln('string: ${prefs.getString('string') ?? ''}');
    data.write(
        'stringList: ${prefs.getStringList('stringList') ?? <String>[]}');
    setState(() {});
  }
}
