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

/// The [CMInfoPanelShowcase] class provides a visual representation of [CMInfoPanel]
/// with various configuration examples.
class CMInfoPanelShowcase extends StatelessWidget {
  static String path = '/infoPanel';

  const CMInfoPanelShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'CMInfoPanel Showcase',
      children: [
        createShowcaseTitle(
          'Basic configuration - Displays an info panel with default icon and single line text.',
        ),
        const CMInfoPanel(
          content: 'This is an|informational message',
          boldPositions: [1],
        ),
        createShowcaseTitle(
          'Multi-line content - Shows how the panel handles longer text with line breaks.',
        ),
        const CMInfoPanel(
          content: 'This is a|multi-line|informational message|that wraps to the next line',
          boldPositions: [1, 3],
          maxLines: 2,
        ),
        createShowcaseTitle(
          'Custom icon - Demonstrates using a custom icon with the info panel.',
        ),
        const CMInfoPanel(
          content: 'Warning:|This is a warning message',
          boldPositions: [0],
          icon: Icon(Icons.warning, color: Colors.orange),
        ),
        createShowcaseTitle(
          'Text overflow - Demonstrates how the panel handles text that is too long for its container.',
        ),
        const CMInfoPanel(
          content:
              'This is a very long message that will not fit in the available space and should show an ellipsis at the end when it overflows.',
          maxLines: 1,
        ),
      ],
    );
  }
}
