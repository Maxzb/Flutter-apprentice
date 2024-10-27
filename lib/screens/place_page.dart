// 1
import 'package:flutter/material.dart';
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
  // TODO: Add Desktop Threshold
  // TODO: Add Constraint Properties
  // TODO: Calculate Constrained Width
  // TODO: Add Calculate Column Count
  // TODO: Build Custom Scroll View
  // TODO: Build Sliver App Bar
  // TODO: Build Info Section
  // TODO: Build Grid Item
  // TODO: Build Section Title
  // TODO: Build Grid View
  // TODO: Build Grid View Section
  // TODO: Replace build method

  @override
  Widget build(BuildContext context) {
    // 5
    return const Scaffold(
      body: Center(
        // TODO: Replace with Custom Scroll View
        child: Text(
          'Place Page',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
