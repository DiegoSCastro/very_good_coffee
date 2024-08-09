import 'package:flutter/material.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

class NoConnectionPlaceholder extends StatelessWidget {
  const NoConnectionPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.wifi_off_rounded,
              size: 64,
            ),
            Text(
              '${context.l10n.noInternet}\n'
              '${context.l10n.youCanStillSeeFavorites}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
