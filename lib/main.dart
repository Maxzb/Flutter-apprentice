import 'package:flutter/material.dart';
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
  void changeThemeMode(bool useLightMode) {
    setState(() {
      // 1
      themeMode = useLightMode
          ? ThemeMode.light //
          : ThemeMode.dark;
    });
  }

  void changeColor(int value) {
    setState(() {
      // 2
      colorSelected = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy';
    ThemeMode themeMode = ThemeMode.dark; // Manual theme toggle
    ColorSelection colorSelected = ColorSelection.deepOrange;
    //3
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      //debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner
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
          foregroundColor: Colors.white,
          // TODO: Add action buttons
          elevation: 4.0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appTitle,
                // style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text(
            'You Hungry?',
            // style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
