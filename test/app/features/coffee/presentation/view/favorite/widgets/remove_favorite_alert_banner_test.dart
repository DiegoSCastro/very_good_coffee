import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

void main() {
  group('RemoveFavoriteAlertBanner', () {
    testWidgets('displays banner when button is pressed', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: RemoveFavoriteAlertBanner(),
          ),
        ),
      );

      // Tap the IconButton to trigger the banner
      await tester.tap(find.byIcon(Icons.info_outline));
      await tester.pump(); // Rebuilds the widget tree

      // Verify the MaterialBanner is displayed
      expect(find.byType(MaterialBanner), findsOneWidget);
      expect(find.text('Drag left to remove favorite item'), findsOneWidget);
    });
  });
}
