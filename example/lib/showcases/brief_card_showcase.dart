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

import 'package:car_manager_ui/constants/image_constants.dart';
import 'package:car_manager_ui/showcase_utils.dart';
import 'package:car_manager_ui/showcases/showcase_app_base.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

/// The [BriefCardShowcase] class demonstrates different styles and functionalities of the
/// [CMBriefCard] widget, offering a visual representation of how it can be used within the
/// application.
class BriefCardShowcase extends StatelessWidget {
  /// This path is used to navigate to the brief card showcase using GoRouter.
  static String path = '/briefCard';

  const BriefCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'CMBriefCard showcase',
      children: [
        createShowcaseTitle('This version demonstrates the default behavior of the CMBriefCard with an icon, title, and description. It is enabled and fully interactive.'),
        CMBriefCard(
          iconPath: kSearchImage,
          title: 'Card Title',
          description: 'This is a description of the card.',
          onPressed: () {
            printValue('Default CMBriefCard pressed');
          },
        ),
        createShowcaseTitle('Disabled CMBriefCard. The card icon and text appear in a muted color, and the card cannot be clicked.'),
        CMBriefCard(
          iconPath: kFolderImage,
          title: 'Disabled Card',
          description: 'This card is disabled and cannot be clicked.',
          onPressed: () {},
          isEnabled: false,
        ),
        createShowcaseTitle('CMBriefCard without an icon, only displaying the title and description text, making it suitable for simpler presentations.'),
        CMBriefCard(
          title: 'No Image Card',
          description: 'This card does not include an image icon.',
          onPressed: () {
            printValue('CMBriefCard without image pressed');
          },
        ),
        createShowcaseTitle('CMBriefCard with a longer description'),
        CMBriefCard(
          iconPath: kSuccessImage,
          title: 'Card with Longer Description',
          description:
          'This card demonstrates a longer description text to show how the layout adapts.',
          onPressed: () {
            printValue('Card with long description pressed');
          },
        ),
      ],
    );
  }
}
