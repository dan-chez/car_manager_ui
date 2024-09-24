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
