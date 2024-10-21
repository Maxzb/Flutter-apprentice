import 'package:flutter/material.dart';
import '../models/place.dart';

class PlaceLandscapeCard extends StatelessWidget {
  final Place place;
  const PlaceLandscapeCard({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            // 1
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8.0),
            ),
            // 2
            child: AspectRatio(
              aspectRatio: 2,
              child: Image.asset(
                place.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            // 1
            title: Text(
              place.name,
              style: textTheme.titleSmall,
            ),
            // 2
            subtitle: Text(
              place.attributes,
              maxLines: 1,
              style: textTheme.bodySmall,
            ),
            // 3
            onTap: () {
              // ignore: avoid_print   print('Tap on ${restaurant.name}');
            },
          ),
        ],
      ),
    );
  }
}
