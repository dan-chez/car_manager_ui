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

/// The [ProfileMenuItemShowcase] class demonstrates different styles and functionalities of the
/// [ProfileMenuItem] widget, offering a visual representation of how it can be used within the
/// application.
class ProfileMenuItemShowcase extends StatelessWidget {
  static String path = '/profileMenuItem';

  const ProfileMenuItemShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    const onPressedSnackBar = SnackBar(
      content: Text('You pressed the profile menu item!'),
    );

    return ShowcaseAppBase(
      title: 'Profile menu item showcase',
      children: [
        createShowcaseTitle(
          'Displays a simple profile menu item with an icon, text and allows for a callback when pressed.',
        ),
        ProfileMenuItem(
          item: ProfileMenuItemModel(
            content: 'Option 1',
            onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
            icon: const Icon(Icons.person),
          ),
        ),
        createShowcaseTitle('Long Label Item'),
        ProfileMenuItem(
          item: ProfileMenuItemModel(
            content: 'Very long menu item title that might overflow or wrap',
            onPressed: () => showCustomSnackBar(context, onPressedSnackBar),
            icon: const Icon(Icons.info_outline),
          ),
        ),
      ],
    );
  }
}
