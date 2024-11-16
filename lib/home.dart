import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/models/auth.dart';
import 'models/cart_manager.dart';
import 'components/theme_button.dart';
import 'components/color_button.dart';
import 'constants.dart';
import 'components/post_card.dart';
import 'models/order_manager.dart';
import 'models/post.dart';
import 'screens/explore_page.dart';
import 'screens/myorders_page.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.auth,
    required this.cartManager,
    required this.ordersManager,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
    required this.tab,
  });

  final YummyAuth auth;
  final int tab;
  final CartManager cartManager;
  final OrderManager ordersManager;
  final ColorSelection colorSelected;
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;

  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Home',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Orders',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Raw black',
      selectedIcon: Icon(Icons.credit_card),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: Define pages
    final pages = [
      // TODO: Replace with Category Card
      ExplorePage(
        cartManager: widget.cartManager,
        orderManager: widget.ordersManager,
      ),
      MyOrdersPage(orderManager: widget.ordersManager),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PostCard(post: posts[0]),
        ),
      ),
      // Container(color: Colors.blueGrey)
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          ThemeButton(
            changeThemeMode: widget.changeTheme,
          ),
          ColorButton(
            changeColor: widget.changeColor,
            colorSelected: widget.colorSelected,
          ),
        ],
      ),
      // TODO: Switch between pages
      body: IndexedStack(
        index: widget.tab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.tab,
        onDestinationSelected: (index) {
          context.go('/$index');
          // setState(() {
          //   tab = index;
          // });
        },
        destinations: appBarDestinations,
      ),
    );
  }
}
