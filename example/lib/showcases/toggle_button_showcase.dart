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

/// The [ToggleButtonShowcase] class demonstrates different styles and functionalities of the
/// [CMToggleButton] widget, offering a visual representation of how it can be used within the
/// application.
class ToggleButtonShowcase extends StatelessWidget {
  /// This path is used to navigate to the toggle button showcase using GoRouter.
  static String path = '/toggleButton';

  const ToggleButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'Toggle button showcase',
      children: [
        Column(
          children: [
            createShowcaseTitle(
              'Default behavior of the CMToggleButton with two options. It switches between "Option 1" and "Option 2".',
            ),
            CMToggleButton(
              labels: const ['Option 1', 'Option 2'],
              onChanged: (index) {
                printValue('Selected option index: $index');
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: createShowcaseTitle(
                'CMToggleButton with three options.',
              ),
            ),
            CMToggleButton(
              labels: const ['Option A', 'Option B', 'Option C'],
              onChanged: (index) {
                printValue('Selected option index: $index');
              },
            ),
            createShowcaseTitle(
              'CMToggleButton with custom labels showing short text, suitable for compact layouts.',
            ),
            CMToggleButton(
              labels: const ['Yes', 'No'],
              onChanged: (index) {
                printValue('Selected option index: $index');
              },
            ),
            createShowcaseTitle(
              'CMToggleButton with multiple options, showcasing a wide variety of labels.',
            ),
            CMToggleButton(
              labels: const [
                'Yes',
                'No',
                'True',
                'False',
                'On',
                'Off',
                'Multiple'
              ],
              onChanged: (index) {
                printValue('Selected option index: $index');
              },
            ),
            createShowcaseTitle(
              'CMToggleButton showcasing customizable background colors.',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 10,
              children: [
                Flexible(
                  child: CMToggleButton(
                    labels: const ['Start', 'Stop'],
                    activeBgColor: kAmaranthPrimary,
                    onChanged: (index) {
                      printValue('Selected option index: $index');
                    },
                  ),
                ),
                Flexible(
                  child: CMToggleButton(
                    activeBgColor: Colors.deepPurple,
                    labels: const ['Dark', 'Light'],
                    onChanged: (index) {
                      printValue('Selected option index: $index');
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
