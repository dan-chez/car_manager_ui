import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

/// The [ButtonShowcase] class provides a visual representation of various button
/// styles and functionalities within the application.
class ButtonShowcase extends StatelessWidget {
  /// This path is used to navigate to the button showcase using GoRouter.
  static String path = '/buttons';

  const ButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    // FIXME Add all possible configurations
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Buttons showcase'),
        ),
        body: Padding(padding: const EdgeInsets.all(10), child: PrimaryButton(txtLabel: 'Test', onPressed: () {})));
  }
}
