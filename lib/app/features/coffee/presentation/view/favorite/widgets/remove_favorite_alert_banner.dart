import 'package:flutter/material.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

class RemoveFavoriteAlertBanner extends StatelessWidget {
  const RemoveFavoriteAlertBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ScaffoldMessenger.of(context).clearMaterialBanners();
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            content: Text(context.l10n.dragToRemoveBanner),
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
