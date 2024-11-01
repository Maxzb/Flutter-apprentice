import 'package:flutter/material.dart';
// 1
import '../components/place_landscape_card.dart';
import '../models/place.dart';

class PlaceSection extends StatelessWidget {
  final List<Place> places;

  const PlaceSection({
    super.key,
    required this.places,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            // 5
            child: Text(
              'Food near me',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // 1
          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: places.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 300,
                  child: PlaceLandscapeCard(
                    place: places[index],
                  ),
                );
              },
            ),
          ),
          // 6
          // Container(
          //   height: 400,
          //   // TODO: Add ListView Here
          //   color: Colors.grey,
          // ),
        ],
      ),
    );
  }
}
