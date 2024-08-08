import 'package:flutter/material.dart';

class AppDismissible extends StatelessWidget {
  final VoidCallback onDismissed;
  final Widget child;

  const AppDismissible({
    required this.onDismissed,
    required this.child,
    super.key,
  });

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
          title: const Text('Are you sure?'),
          content: const Text(
            'Remove this image from favorites? It might be hard to find it again!',
          ),
          actions: [
            FilledButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Remove'),
            ),
          ],
        ),
      ),
      onDismissed: (_) => onDismissed(),
      child: child,
    );
  }
}
