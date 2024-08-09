import 'package:car_manager_ui/showcase_utils.dart';
import 'package:car_manager_ui/showcases/showcase_app_base.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

/// The [IconButtonShowcase] class provides a visual representation of various icon buttons.
class IconButtonShowcase extends StatelessWidget {
  /// This path is used to navigate to the button showcase using GoRouter.
  static String path = '/iconButton';

  const IconButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'Icon buttons showcase',
      children: [
        createShowcaseTitle('CMIconButton', higherSize: true),
        createShowcaseTitle(
            'The CMIconButton widget is a customizable icon button that allows you to specify an icon, an onPressed callback, and optional sizing. It provides a simple and flexible way to create buttons with icons.'),
        const Divider(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CMIconButton(
              icon: const Icon(Icons.add, color: Colors.deepPurple),
              onPressed: () {
                printValue('Add button pressed');
              },
            ),
            const SizedBox(width: 12),
            CMIconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                printValue('Remove button pressed');
              },
              size: const Size(60, 60),
            ),
            const SizedBox(width: 12),
            CMIconButton(
              icon: const Icon(Icons.heart_broken, color: kAmaranthPrimary),
              onPressed: () {
                printValue('Heart broken button pressed');
              },
              size: const Size(40, 50),
            ),
            const SizedBox(width: 12),
            CMIconButton(
              icon: const Icon(Icons.remove_red_eye, color: Colors.orange),
              onPressed: () {
                printValue('Remove red eye button pressed');
              },
              size: const Size(35, 35),
            ),
          ],
        ),
        const Divider(height: 12),
      ],
    );
  }
}
