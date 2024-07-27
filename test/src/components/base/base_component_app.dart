import 'package:flutter/material.dart';

/// Wraps a given widget in a [MaterialApp] with a [Scaffold] as the home.
/// This allows the encapsulation of a widget in a basic app structure to provide necessary
/// context and avoid boilerplate code.
///
/// Example:
/// ```dart
/// testWidgets('Test description', (WidgetTester tester) async {
///   await tester.pumpWidget(
///     baseComponentApp(MyWidget()),
///   );
///   // Additional test code here
/// });
/// ```
///
/// - [widget]: The widget to be wrapped in the app structure.
///
/// Returns a [MaterialApp] with the provided widget as its body.
Widget baseComponentApp(Widget widget) {
  return MaterialApp(
    home: Scaffold(
      body: widget,
    ),
  );
}
