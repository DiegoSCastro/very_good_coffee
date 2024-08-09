import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee/app/app.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

void main() {
  group('AppDismissible', () {
    testWidgets('renders child widget', (tester) async {
      const childWidget = Text('Dismissible Child');

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: AppDismissible(
              onDismissed: () {},
              child: childWidget,
            ),
          ),
        ),
      );

      expect(find.byWidget(childWidget), findsOneWidget);
    });

    testWidgets('shows confirmation dialog on swipe', (tester) async {
      const childWidget = Text('Dismissible Child');
      var wasDismissed = false;

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: AppDismissible(
              onDismissed: () {
                wasDismissed = true;
              },
              child: childWidget,
            ),
          ),
        ),
      );

      await tester.drag(find.byType(AppDismissible), const Offset(-500, 0));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Are you sure?'), findsOneWidget);

      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      expect(wasDismissed, isFalse);

      await tester.drag(find.byType(AppDismissible), const Offset(-500, 0));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Remove'));
      await tester.pumpAndSettle();

      expect(wasDismissed, isTrue);
    });

    testWidgets('displays delete icon when swiping', (tester) async {
      const childWidget = Text('Dismissible Child');

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: AppDismissible(
              onDismissed: () {},
              child: childWidget,
            ),
          ),
        ),
      );

      await tester.drag(find.byType(AppDismissible), const Offset(-50, 0));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.delete), findsOneWidget);
    });
  });
}
