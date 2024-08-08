import 'package:flutter/material.dart';

class NoConnectionPlaceholder extends StatelessWidget {
  const NoConnectionPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 64),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 64,
            ),
            Text(
              'No internet Connection\n'
              'You can still see your favorite images',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
