import 'package:flutter/material.dart';
import 'package:yummy/constants.dart';

import 'home.dart';
import 'models/cart_manager.dart';
import 'models/order_manager.dart';

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
  ColorSelection colorSelected = ColorSelection.teal;

  final CartManager _cartManager = CartManager();
  final OrderManager _orderManager = OrderManager();

  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void changeColor(int value) {
    setState(() {
      colorSelected = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy';

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
      home: Home(
        changeTheme: changeThemeMode,
        changeColor: changeColor,
        colorSelected: colorSelected,
        cartManager: _cartManager,
        ordersManager: _orderManager,
      ),
    );
  }
}
