import 'package:flutter/material.dart';
import '../api/mock_yummy_service.dart';
import '../components/category_section.dart';
import '../components/places_section.dart';
import '../components/post_section.dart';
import '../models/cart_manager.dart';

class ExplorePage extends StatelessWidget {
  final mockService = MockYummyService();
  final CartManager cartManager;

  ExplorePage({super.key, required this.cartManager});

  @override
  Widget build(BuildContext context) {
    // 1
    return FutureBuilder(
      // 2
      future: mockService.getExploreData(),
      // 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          final places = snapshot.data?.places ?? [];
          final categories = snapshot.data?.categories ?? [];
          final posts = snapshot.data?.friendPosts ?? [];

          // 1
          return ListView(
            // 2
            shrinkWrap: true,
            // 3
            scrollDirection: Axis.vertical,
            // 4
            children: [
              PlaceSection(
                places: places,
                cartManager: cartManager,
              ),
              CategorySection(categories: categories),
              PostSection(posts: posts),
            ],
          );
        } else {
          // 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
    // return const Center(
    //   child: Text(
    //     'Explore Page Setup',
    //     style: TextStyle(fontSize: 32.0),
    //   ),
    // );
  }
}
