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

/// The [EmptyListShowcase] class provides a visual demonstration of different
/// empty list layouts and styles used within the application.
class EmptyListShowcase extends StatelessWidget {
  /// This path is used to navigate to the empty list showcase using GoRouter.
  static String path = '/emptyList';

  const EmptyListShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'Empty list showcase',
      children: [
        createShowcaseTitle('CMEmptyList', higherSize: true),
        createShowcaseTitle(
            'No items available, standard message with emphasis on key words.'),
        const CMEmptyList(
          text: 'Opps! no items|found',
          boldPositions: [1],
          imagePath: kCarErrorImageSvg,
        ),
        const SizedBox(height: 40),
        createShowcaseTitle('Custom message emphasizing multiple words.'),
        const CMEmptyList(
          text: 'Oops!|No products|found here',
          boldPositions: [0, 2],
          imagePath: kCarImage,
        ),
        const SizedBox(height: 40),
        createShowcaseTitle('If the image path is null, displaying text only.'),
        const CMEmptyList(
          text: 'Looks like|your garage is|empty',
          boldPositions: [1, 2],
        ),
      ],
    );
  }
}
