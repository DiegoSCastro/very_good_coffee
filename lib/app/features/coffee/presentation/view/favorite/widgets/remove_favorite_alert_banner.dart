import 'package:flutter/material.dart';

class RemoveFavoriteAlertBanner extends StatelessWidget {
  const RemoveFavoriteAlertBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            content: const Text('Drag left to remove favorite item'),
            actions: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed:
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner,
              ),
            ],
          ),
        );
      },
      icon: const Icon(Icons.info_outline),
    );
  }
}
