// 1
import 'package:flutter/material.dart';
import '../components/place_item.dart';
import '../models/place.dart';

// 2
class PlacePage extends StatefulWidget {
  final Place place;

  // 3
  const PlacePage({
    super.key,
    required this.place,
  });

  @override
  State<PlacePage> createState() => _PlacePageState();
}

// 4
class _PlacePageState extends State<PlacePage> {
  static const desktopThreshold = 700;

  static const double largeScreenPercentage = 0.9;
  static const double maxWidth = 1000;

  double _calculateConstrainedWidth(double screenWidth) {
    return (screenWidth > desktopThreshold
            ? screenWidth * largeScreenPercentage
            : screenWidth)
        .clamp(0.0, maxWidth);
  }

  // TODO: Add Calculate Column Count
  int calculateColumnCount(double screenWidth) {
    return screenWidth > desktopThreshold ? 2 : 1;
  }

  CustomScrollView _buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(),
        _buildInfoSection(),
        _buildGridViewSection('Menu'),
        // SliverToBoxAdapter(
        //   child: Container(
        //     height: 300.0,
        //     color: Colors.lightGreenAccent,
        //   ),
        // ),
        // TODO: Add Menu Item Grid View Section
        // SliverFillRemaining(
        //   child: Container(
        //     height: 100.0,
        //     color: Colors.tealAccent,
        //   ),
        // ),
      ],
    );
  }

  SliverAppBar _buildSliverAppBar() {
    // 1
    return SliverAppBar(
      // 2
      pinned: true,
      // 3
      expandedHeight: 300.0,
      // 4
      flexibleSpace: FlexibleSpaceBar(
        // 5
        background: Center(
          // 6
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 64.0,
            ),
            // 7
            child: Stack(
              children: [
                // 8
                Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                    // 9
                    image: DecorationImage(
                      image: AssetImage(widget.place.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // 10
                const Positioned(
                  bottom: 6.0,
                  left: 16.0,
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.store,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 1
  SliverToBoxAdapter _buildInfoSection() {
    // 2
    final textTheme = Theme.of(context).textTheme;
    // 3
    final restaurant = widget.place;
    // 4
    return SliverToBoxAdapter(
      // 5
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // 6
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 7
            Text(
              restaurant.name,
              style: textTheme.headlineLarge,
            ),
            Text(
              restaurant.address,
              style: textTheme.bodySmall,
            ),
            Text(
              restaurant.getRatingAndDistance(),
              style: textTheme.bodySmall,
            ),
            Text(
              restaurant.attributes,
              style: textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(int index) {
    final item = widget.place.items[index];
    return InkWell(
      onTap: () {
        // Present Bottom Sheet in the future.
      },
      child: PlaceItem(item: item),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 1
  GridView _buildGridView(int columns) {
    // 2
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      // 3
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 3.5,
        crossAxisCount: columns,
      ),
      // 4
      itemBuilder: (context, index) => _buildGridItem(index),
      // 5
      itemCount: widget.place.items.length,
      // 6
      shrinkWrap: true,
      // 7
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  // TODO: Build Grid View Section
  SliverToBoxAdapter _buildGridViewSection(String title) {
    final columns = calculateColumnCount(MediaQuery.of(context).size.width);
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(title),
            _buildGridView(columns),
          ],
        ),
      ),
    );
  }
  // TODO: Replace build method

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final constrainedWidth = _calculateConstrainedWidth(screenWidth);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: constrainedWidth,
          child: _buildCustomScrollView(),
        ),
      ),
    );
  }
}
