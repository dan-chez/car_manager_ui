import 'package:car_manager_ui/showcase_utils.dart';
import 'package:car_manager_ui/showcases/showcase_app_base.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The [DialogsShowcase] class provides a visual representation of Dialogs
/// styles and functionalities within the application.
class DialogsShowcase extends StatelessWidget {
  /// This path is used to navigate to the button showcase using GoRouter.
  static String path = '/dialogs';

  const DialogsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'Dialogs showcase',
      children: [
        createShowcaseTitle('ConfirmDialog', higherSize: true),
        createShowcaseTitle('Basic confirmation dialog with message an button, shows close button, can pop'),
        PrimaryButton(
          txtLabel: 'Confirm dialog',
          onPressed: () {
            context.push(
              ConfirmDialogRoute.path,
              extra: _getDialogContent(
                message: 'Basic confirm dialog',
                buttonText: 'Button',
                boldPositions: [],
              ),
            );
          },
        ),
        createShowcaseTitle('Basic confirmation dialog with message an button, can\'t pop'),
        PrimaryButton(
          txtLabel: 'Confirm dialog',
          onPressed: () {
            context.push(
              ConfirmDialogRoute.path,
              extra: _getDialogContent(
                message: 'Basic confirm dialog',
                buttonText: 'Button',
                boldPositions: [],
                showCloseButton: false,
                canPop: false,
              ),
            );
          },
        ),
        createShowcaseTitle('Basic confirmation dialog with message with bold words an button, shows close button, can pop'),
        PrimaryButton(
          txtLabel: 'Confirm dialog',
          onPressed: () {
            context.push(
              ConfirmDialogRoute.path,
              extra: _getDialogContent(
                message: 'Basic confirm dialog,|this is bold',
                buttonText: 'Button',
                boldPositions: [1],
              ),
            );
          },
        ),
      ],
    );
  }

  ConfirmDialogData _getDialogContent({
    required String message,
    required String buttonText,
    required List<int> boldPositions,
    bool canPop = true,
    bool showCloseButton = true,
    bool popWhenOnPressed = true,
  }) {
    return ConfirmDialogData(
      message: message,
      buttonText: buttonText,
      canPop: canPop,
      showCloseButton: showCloseButton,
      popWhenOnPressed: popWhenOnPressed,
      boldPositions: boldPositions,
      onPressed: () {},
    );
  }
}
