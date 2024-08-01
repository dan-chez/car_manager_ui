import 'package:flutter/material.dart';

/// A stateless widget that serves as a base structure for a screen with a customizable title.
///
/// The [ShowcaseAppBase] widget uses a [Scaffold] to create a standard page layout
/// that includes an [AppBar] with a title. The background color of the [AppBar] is
/// dynamically set based on the current theme's color scheme. This class can be used
/// as a base for screens that need a consistent app bar layout across the application.
///
/// Example usage:
/// ```dart
/// ShowcaseAppBase(title: 'TextField showcase', body: child);
/// ```
class ShowcaseAppBase extends StatelessWidget {
  final String title;
  final Widget body;

  const ShowcaseAppBase({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: body,
    );
  }
}
