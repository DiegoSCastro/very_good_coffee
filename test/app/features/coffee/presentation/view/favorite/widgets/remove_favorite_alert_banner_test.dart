import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  testWidgets('displays and hides material banner when icon button is pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RemoveFavoriteAlertBanner(),
        ),
      ),
    );

    final iconButton = find.byIcon(Icons.info_outline);
    expect(iconButton, findsOneWidget);

    await tester.tap(iconButton);
    await tester.pumpAndSettle();

    expect(find.byType(MaterialBanner), findsOneWidget);
    expect(find.text('Drag left to remove favorite item'), findsOneWidget);

    final closeIconButton = find.byIcon(Icons.close);
    expect(closeIconButton, findsOneWidget);

    await tester.tap(closeIconButton);
    await tester.pumpAndSettle();

    expect(find.byType(MaterialBanner), findsNothing);
  });
}
