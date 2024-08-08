import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart'; // Ajuste o caminho para o local correto do seu widget

void main() {
  testWidgets('NoConnectionPlaceholder displays correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: NoConnectionPlaceholder(),
        ),
      ),
    );

    expect(find.byIcon(Icons.wifi_off_rounded), findsOneWidget);

    expect(
      find.text(
        'No internet Connection\nYou can still see your favorite images',
      ),
      findsOneWidget,
    );
  });
}
