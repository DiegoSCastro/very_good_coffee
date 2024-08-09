// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

void main() {
  testWidgets('NoConnectionPlaceholder displays correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: NoConnectionPlaceholder(),
        ),
      ),
    );

    expect(find.byIcon(Icons.wifi_off_rounded), findsOneWidget);

    expect(
      find.text(
        '${AppLocalizations.of(tester.element(find.byType(NoConnectionPlaceholder))).noInternet}\n'
        '${AppLocalizations.of(tester.element(find.byType(NoConnectionPlaceholder))).youCanStillSeeFavorites}',
      ),
      findsOneWidget,
    );
  });
}
