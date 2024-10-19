import 'package:flutter/material.dart';
import 'package:yummy/components/color_button.dart';
import 'package:yummy/components/theme_button.dart';
import 'package:yummy/constants.dart';

void main() => runApp(const Yummy());

class Yummy extends StatefulWidget {
  // TODO: Setup default theme
  // 2
  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.pink;

  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode
          ? ThemeMode.light //
          : ThemeMode.dark;
    });
  }

  void changeColor(int value) {
    setState(() {
      colorSelected = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Discs';
    //3
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      // TODO: Replace Scaffold with Home widget
      // 4
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.blueAccent,
          // foregroundColor: Colors.amberAccent,
          elevation: 4.0,
          actions: [
            ThemeButton(
              changeThemeMode: changeThemeMode,
            ),
            ColorButton(
              changeColor: changeColor,
              colorSelected: colorSelected,
            ),
          ],
          title: const Text(
            appTitle,
            // style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
        ),
        body: const Center(
          child: Text(
            'You love black metal?',
            // style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
