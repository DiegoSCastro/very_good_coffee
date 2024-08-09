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

      // Swipe the dismissible
      await tester.drag(find.byType(AppDismissible), const Offset(-500, 0));
      await tester.pumpAndSettle();

      // Verify the dialog is shown
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Are you sure?'), findsOneWidget);

      // Tap on "Cancel"
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Verify that the item was not dismissed
      expect(wasDismissed, isFalse);

      // Swipe again to show the dialog
      await tester.drag(find.byType(AppDismissible), const Offset(-500, 0));
      await tester.pumpAndSettle();

      // Tap on "Remove"
      await tester.tap(find.text('Remove'));
      await tester.pumpAndSettle();

      // Verify that the item was dismissed
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

      // Swipe the dismissible to reveal the delete icon
      await tester.drag(find.byType(AppDismissible), const Offset(-50, 0));
      await tester.pumpAndSettle();

      // Verify the delete icon is displayed
      expect(find.byIcon(Icons.delete), findsOneWidget);
    });
  });
}
