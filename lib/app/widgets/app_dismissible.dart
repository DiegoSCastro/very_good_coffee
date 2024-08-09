import 'package:flutter/material.dart';
import 'package:very_good_coffee/l10n/l10n.dart';

class AppDismissible extends StatelessWidget {
  const AppDismissible({
    required this.onDismissed,
    required this.child,
    super.key,
  });
  final VoidCallback onDismissed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(context.l10n.areYouSureQuestion),
          content: Text(
            context.l10n.removeConfirmMessage,
          ),
          actions: [
            FilledButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(context.l10n.cancel),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(context.l10n.remove),
            ),
          ],
        ),
      ),
      onDismissed: (_) => onDismissed(),
      child: child,
    );
  }
}
