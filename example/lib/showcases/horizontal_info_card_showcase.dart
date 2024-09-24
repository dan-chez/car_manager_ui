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

/// The [HorizontalInfoCardShowcase] class provides a visual representation of [HorizontalInfoCard].
class HorizontalInfoCardShowcase extends StatelessWidget {
  /// This path is used to navigate to the HorizontalInfoCard showcase using GoRouter.
  static String path = '/horizontalInfoCard';

  const HorizontalInfoCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'HorizontalInfoCard showcase',
      children: [
        createShowcaseTitle(
          'Displays a card with a horizontal layout featuring a primary value and a description.',
        ),
        const HorizontalInfoCard(
          textValue: '100',
          textDescription: 'Text description',
        ),
        createShowcaseTitle(
          'Vertical stack of HorizontalInfoCard showcasing different metrics.',
        ),
        const Column(
          children: [
            HorizontalInfoCard(
              textValue: '60',
              textDescription: 'Text Description',
            ),
            SizedBox(height: 10),
            HorizontalInfoCard(
              textValue: '500000',
              textDescription: 'Monthly Earnings',
            ),
          ],
        ),
        createShowcaseTitle(
          'Two HorizontalInfoCard side by side, each adapting to the available width.',
        ),
        const Row(
          children: [
            Flexible(
              child: HorizontalInfoCard(
                textValue: '1000',
                textDescription: 'Text Description',
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: HorizontalInfoCard(
                textValue: '30',
                textDescription: 'Description',
              ),
            ),
          ],
        ),
        createShowcaseTitle(
          'HorizontalInfoCard with long description',
        ),
        const HorizontalInfoCard(
          textValue: '100',
          textDescription: 'This is a showcase with long description for HorizontalInfoCard in HorizontalInfoCardShowcase',
        ),
      ],
    );
  }
}
