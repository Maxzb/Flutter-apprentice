import 'package:flutter/material.dart';
import '../models/place.dart';

class PlaceLandscapeCard extends StatefulWidget {
  final Place place;
  final Function() onTap;

  const PlaceLandscapeCard({
    super.key,
    required this.place,
    required this.onTap,
  });

  @override
  State<PlaceLandscapeCard> createState() => _PlaceLandscapeCardState();
}

class _PlaceLandscapeCardState extends State<PlaceLandscapeCard> {
  bool _isFavorited = false;

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
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8.0),
              ),
              child: AspectRatio(
                aspectRatio: 2,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      widget.place.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 4.0,
                      right: 4.0,
                      child: IconButton(
                        icon: Icon(
                          _isFavorited ? Icons.favorite : Icons.favorite_border,
                        ),
                        iconSize: 30.0,
                        color: Colors.red[400],
                        onPressed: () {
                          setState(() {
                            _isFavorited = !_isFavorited;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )),
          ListTile(
            title: Text(
              widget.place.name,
              style: textTheme.titleSmall,
            ),
            subtitle: Text(
              widget.place.attributes,
              maxLines: 1,
              style: textTheme.bodySmall,
            ),
            onTap: widget.onTap,
          ),
        ],
      ),
    );
  }
}
