import 'package:flutter/material.dart';
import 'models/cart_manager.dart';
import 'models/disc_category.dart';
import 'components/theme_button.dart';
import 'components/color_button.dart';
import 'constants.dart';
import 'components/category_card.dart';
import 'components/post_card.dart';
import 'models/order_manager.dart';
import 'models/post.dart';
import 'components/place_landscape_card.dart';
import 'models/place.dart';
import 'screens/explore_page.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
    required this.cartManager,
    required this.ordersManager,
  });

  final CartManager cartManager;
  final OrderManager ordersManager;
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;

  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Blackgaze',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Posts',
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
      // Container(color: Colors.amberAccent),
      // 1
      ExplorePage(
        cartManager: widget.cartManager,
        orderManager: widget.ordersManager,
      ),
      // Center(
      //   // 2
      //   child: ConstrainedBox(
      //     constraints: const BoxConstraints(maxWidth: 300),
      //     // 3
      //     // child: const Text('test13'),
      //     child: CategoryCard(category: categories[0]),
      //   ),
      // ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PostCard(post: posts[0]),
        ),
      ),
      // 1
      // Center(
      //   //2
      //   child: ConstrainedBox(
      //     constraints: const BoxConstraints(maxWidth: 400),
      //     // 3
      //     child: PlaceLandscapeCard(
      //       place: places[0],
      //     ),
      //   ),
      // ),
      Container(color: Colors.blueGrey)
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
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
        index: tab,
        children: pages,
      ),
      // Old body code
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     children: [
      //       Text(
      //         'You love black metal?',
      //         style: Theme.of(context).textTheme.headlineSmall,
      //       ),
      //       const SizedBox(width: 100, height: 100, child: Placeholder()),
      //     ],
      //   ),
      // ),
      // 1
      bottomNavigationBar: NavigationBar(
        // 2
        selectedIndex: tab,
        // 3
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
        // 4
        destinations: appBarDestinations,
      ),
    );
  }
}
