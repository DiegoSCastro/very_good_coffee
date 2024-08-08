import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:very_good_coffee/app/features/coffee/coffee.dart';

class ImageViewPage extends StatefulWidget {
  const ImageViewPage({super.key});

  @override
  State<ImageViewPage> createState() => _$ImageViewPageState();
}

class _$ImageViewPageState extends State<ImageViewPage> {
  late final CoffeeImage coffeeImage;

  @override
  void didChangeDependencies() {
    coffeeImage = ModalRoute.of(context)!.settings.arguments! as CoffeeImage;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SelectableText(
              coffeeImage.imageUrl,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Hero(
              tag: coffeeImage.id,
              child: InteractiveViewer(
                clipBehavior: Clip.none,
                child: Image.memory(
                  Uint8List.fromList(coffeeImage.bytes),
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      return child;
                    }
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: frame != null
                          ? child
                          : Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.grey,
                            ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
