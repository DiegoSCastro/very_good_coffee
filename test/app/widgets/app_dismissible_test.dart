import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';

void main() {
  group('AppDismissible', () {
    testWidgets('triggers onDismissed when confirmed', (tester) async {
      var dismissed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDismissible(
              onDismissed: () => dismissed = true,
              child: const ListTile(title: Text('Dismissible Item')),
            ),
          ),
        ),
      );

      await tester.drag(find.text('Dismissible Item'), const Offset(-500, 0));
      await tester.pumpAndSettle();

      expect(find.text('Are you sure?'), findsOneWidget);

      await tester.tap(find.text('Remove'));
      await tester.pumpAndSettle();

      expect(dismissed, isTrue);
    });

    testWidgets('does not trigger onDismissed when cancelled', (tester) async {
      var dismissed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDismissible(
              onDismissed: () => dismissed = true,
              child: const ListTile(title: Text('Dismissible Item')),
            ),
          ),
        ),
      );

      await tester.drag(find.text('Dismissible Item'), const Offset(-500, 0));
      await tester.pumpAndSettle();

      expect(find.text('Are you sure?'), findsOneWidget);

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(dismissed, isFalse);
    });

    testWidgets('shows delete icon during swipe', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDismissible(
              onDismissed: () {},
              child: const ListTile(title: Text('Dismissible Item')),
            ),
          ),
        ),
      );

      await tester.drag(find.text('Dismissible Item'), const Offset(-100, 0));
      await tester.pump();

      expect(find.byIcon(Icons.delete), findsOneWidget);
    });
  });
}
