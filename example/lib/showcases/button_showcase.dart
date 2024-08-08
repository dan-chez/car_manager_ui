import 'package:car_manager_ui/showcase_utils.dart';
import 'package:car_manager_ui/showcases/showcase_app_base.dart';
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
    return ShowcaseAppBase(
      title: 'Buttons showcase',
      children: [
        createShowcaseTitle('PrimaryButton', higherSize: true),
        createShowcaseTitle('Can perform an action, receives a title.'),
        PrimaryButton(
          txtLabel: 'Click me',
          onPressed: () {
            printValue('Button pressed');
          },
        ),
        createShowcaseTitle('Can perform an action, receives a title, icon, custom style.'),
        PrimaryButton(
          txtLabel: 'Click me',
          icon: kAddExpenseIconRed,
          buttonStyle: kCMOutlinedButtonStyle,
          textStyle: kCMOutLinedButtonTextStyle,
          onPressed: () {
            printValue('Button pressed');
          },
        ),
        createShowcaseTitle('IsLoading = true: Cannot perform an action.'),
        PrimaryButton(
          txtLabel: 'Click me',
          isLoading: true,
          onPressed: () {
            printValue('Button pressed');
          },
        ),
        createShowcaseTitle('Button disabled.'),
        PrimaryButton(
          txtLabel: 'You can\'t click me',
          isEnabled: false,
          onPressed: () {
            printValue('Button pressed');
          },
        ),
      ],
    );
  }
}
