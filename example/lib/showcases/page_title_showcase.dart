import 'package:car_manager_ui/showcase_utils.dart';
import 'package:car_manager_ui/showcases/showcase_app_base.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

/// The [PageTitleShowcase] class provides a visual representation of [CMPageTitle]
class PageTitleShowcase extends StatelessWidget {
  /// This path is used to navigate to the textField showcase using GoRouter.
  static String path = '/pageTitle';

  const PageTitleShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'PageTitle showcase',
      children: [
        createShowcaseTitle('CMPageTitle', higherSize: true),
        createShowcaseTitle('The `CMPageTitle` widget is designed to display a page title with a combination of light and bold text. It provides options to customize the text and include an optional bottom divider.'),
        const CMPageTitle(
          lightTitle: 'Welcome to',
          boldTitle: 'Flutter',
          showBottomDivider: true,
        ),
        createShowcaseTitle('Without bottom divider.'),
        const CMPageTitle(
          lightTitle: 'Getting Started with',
          boldTitle: 'Dart',
          showBottomDivider: false,
        ),
      ],
    );
  }
}
