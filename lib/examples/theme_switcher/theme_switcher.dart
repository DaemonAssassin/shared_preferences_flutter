import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(const ThemeSwitcher());
}

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  void initState() {
    super.initState();
    getTheme();
  }

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: value ? ThemeConstants.kDarkTheme : ThemeConstants.kLightTheme,
      home: Scaffold(
        body: Center(
          child: Switch(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  void onChanged(bool isDark) {
    if (isDark) {
      setThemeDark(true);
      setState(() {
        value = true;
      });
    } else {
      setThemeDark(false);
      setState(() {
        value = false;
      });
    }
  }

  // method to save data to prefs
  void setThemeDark(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark);
  }

  void getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    var isDark = prefs.getBool('isDark');
    value = isDark ?? false;
    setState(() {});
  }
}

class ThemeConstants {
  static final kDarkTheme = ThemeData(brightness: Brightness.dark);
  static final kLightTheme = ThemeData(brightness: Brightness.light);
}
