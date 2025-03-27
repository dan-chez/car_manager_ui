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

/// The [WarningInfoShowcase] class demonstrates different configurations and use cases
/// of the [WarningInfo] widget, providing a visual representation of its behavior within
/// the application.
class WarningInfoShowcase extends StatelessWidget {
  static String path = '/warningInfo';

  const WarningInfoShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    const onDismissedSnackBar = SnackBar(
      content: Text('WarningInfo dismissed'),
    );

    return ShowcaseAppBase(
      title: 'WarningInfo Showcase',
      children: [
        createShowcaseTitle('Basic configuration - Dismissible message with bolded segments.'),
        WarningInfo(
          message: 'This is a|critical notice|for the user.',
          boldPositions: const [1],
          onClick: () => showCustomSnackBar(context, onDismissedSnackBar),
        ),
        createShowcaseTitle('Another example - Highlights multiple segments in the message.'),
        WarningInfo(
          message: 'Please|review|and|acknowledge|this warning.',
          boldPositions: const [1, 3],
          onClick: () => showCustomSnackBar(context, onDismissedSnackBar),
        ),
        createShowcaseTitle('Simple message - No bold styling applied.'),
        WarningInfo(
          message: 'System maintenance is scheduled tonight.',
          onClick: () => showCustomSnackBar(context, onDismissedSnackBar),
        ),
        createShowcaseTitle('Long message - Verifies layout behavior with multiline text.'),
        WarningInfo(
          message:
              'Due to scheduled updates|some features might be temporarily unavailable|including vehicle syncing, notifications, and remote access. '
              'Please ensure all critical actions are completed beforehand.',
          boldPositions: const [1],
          onClick: () => showCustomSnackBar(context, onDismissedSnackBar),
        ),
      ],
    );
  }
}
