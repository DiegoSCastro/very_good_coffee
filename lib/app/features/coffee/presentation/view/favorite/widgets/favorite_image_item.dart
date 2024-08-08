import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:very_good_coffee/app/app.dart';

class FavoriteImageItem extends StatelessWidget {
  const FavoriteImageItem({
    required this.coffeeImage,
    required this.onDismissed,
    super.key,
  });
  final CoffeeImage coffeeImage;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    return AppDismissible(
      onDismissed: onDismissed,
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(
          AppRoutes.imageView,
          arguments: coffeeImage,
        ),
        child: Hero(
          tag: coffeeImage.id,
          child: Container(
            height: 132,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: MemoryImage(
                  Uint8List.fromList(coffeeImage.bytes),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
