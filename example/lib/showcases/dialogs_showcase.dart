// Copyright 2024 Danchez
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
              extra: _getConfirmDialogContent(
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
              extra: _getConfirmDialogContent(
                message: 'Basic confirm dialog',
                buttonText: 'Button',
                boldPositions: [],
                showCloseButton: false,
                canPop: false,
              ),
            );
          },
        ),
        createShowcaseTitle(
            'Basic confirmation dialog with message with bold words an button, shows close button, can pop'),
        PrimaryButton(
          txtLabel: 'Confirm dialog',
          onPressed: () {
            context.push(
              ConfirmDialogRoute.path,
              extra: _getConfirmDialogContent(
                message: 'Basic confirm dialog,|this is bold',
                buttonText: 'Button',
                boldPositions: [1],
              ),
            );
          },
        ),
        createShowcaseTitle('Basic confirmation dialog with message an button, shows close button, can pop and image'),
        PrimaryButton(
          txtLabel: 'Confirm dialog',
          onPressed: () {
            context.push(
              ConfirmDialogRoute.path,
              extra: _getConfirmDialogContent(
                message: 'Basic confirm dialog',
                buttonText: 'Button',
                boldPositions: [],
                image: 'assets/success.svg',
              ),
            );
          },
        ),
        createShowcaseTitle('ErrorDialog', higherSize: true),
        createShowcaseTitle('Basic error dialog with title an subtitle'),
        PrimaryButton(
          txtLabel: 'Error dialog',
          onPressed: () {
            context.push(
              ErrorDialogRoute.path,
              extra: const ErrorDialogData(
                title: "You're not the problem,|we are",
                titleBoldPositions: [1],
                subtitle: 'Please try again later',
                imagePath: 'assets/cm_car_error.svg',
              ),
            );
          },
        ),
        createShowcaseTitle('LoadingDialog', higherSize: true),
        createShowcaseTitle('Loading dialog, full screen size, can\'t pop. In 5 seconds will pop'),
        PrimaryButton(
          txtLabel: 'Loading dialog',
          onPressed: () {
            Future.delayed(const Duration(seconds: 5), () {
              context.pop();
            });
            context.push(
              LoadingDialogRoute.path,
              extra: const LoadingDialogData(lottieAssetPath: 'assets/cmloading.json'),
            );
          },
        ),
      ],
    );
  }

  ConfirmDialogData _getConfirmDialogContent({
    required String message,
    required String buttonText,
    required List<int> boldPositions,
    bool canPop = true,
    bool showCloseButton = true,
    bool popWhenOnPressed = true,
    String? image,
  }) {
    return ConfirmDialogData(
      message: message,
      buttonText: buttonText,
      canPop: canPop,
      showCloseButton: showCloseButton,
      popWhenOnPressed: popWhenOnPressed,
      boldPositions: boldPositions,
      onPressed: () {},
      image: image,
    );
  }
}
