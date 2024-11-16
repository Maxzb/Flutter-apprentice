import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/constants.dart';
import 'package:yummy/home.dart';
import 'package:yummy/models/auth.dart';
import 'package:yummy/screens/login_page.dart';

import 'models/cart_manager.dart';
import 'models/order_manager.dart';

void main() => runApp(const Yummy());

class Yummy extends StatefulWidget {
  // TODO: Setup default theme
  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  ThemeMode themeMode = ThemeMode.dark;
  ColorSelection colorSelected = ColorSelection.teal;

  /// Authentication to manage user login session
  // ignore: unused_field
  final YummyAuth _auth = YummyAuth();

  final CartManager _cartManager = CartManager();
  final OrderManager _orderManager = OrderManager();

  late final _router = GoRouter(
    initialLocation: '/login',
    // TODO: Add App Redirect
    routes: [
      GoRoute(
          path: '/login',
          builder: (context, state) =>
              LoginPage(onLogIn: (Credentials credentials) async {
                _auth
                    .signIn(credentials.username, credentials.password)
                    .then((_) => context.go('/${YummyTab.home.value}'));
              })),
      GoRoute(
          path: '/:tab',
          builder: (context, state) {
            return Home(
                auth: _auth,
                cartManager: _cartManager,
                ordersManager: _orderManager,
                changeTheme: changeThemeMode,
                changeColor: changeColor,
                colorSelected: colorSelected,
                tab: int.tryParse(state.pathParameters['tab'] ?? '') ?? 0);
          },
          // 10
          routes: [
            // TODO: Add Restaurant Route
          ]),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
      );
    },
  );

  Future<String?> _appRedirect(
      BuildContext context, GoRouterState state) async {
    final loggedIn = await _auth.loggedIn;
    final isOnLoginPage = state.matchedLocation == '/login';

    // Go to /login if the user is not signed in
    if (!loggedIn) {
      return '/login';
    }
    // Go to root of app / if the user is already signed in
    else if (loggedIn && isOnLoginPage) {
      return '/${YummyTab.home.value}';
    }

    // no redirect
    return null;
  }

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

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      // TODO: Add Custom Scroll Behavior
      title: 'Yummy',
      // scrollBehavior: CustomScrollBehavior(),
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
    );
  }
}
