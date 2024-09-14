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

/// The [VerticalInfoCardShowcase] class provides a visual representation of [VerticalInfoCard].
class VerticalInfoCardShowcase extends StatelessWidget {
  /// This path is used to navigate to the VerticalInfoCard showcase using GoRouter.
  static String path = '/verticalInfoCard';

  const VerticalInfoCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'VerticalInfoCard showcase',
      children: [
        createShowcaseTitle(
          'Displays a card with a vertical layout featuring a primary value and a description.',
        ),
        const VerticalInfoCard(
          textValue: '120',
          textDescription: 'Active Users',
        ),
        createShowcaseTitle(
          'Vertical stack of VerticalInfoCards showcasing different metrics.',
        ),
        const Column(
          children: [
            VerticalInfoCard(
              textValue: '30%',
              textDescription: 'Completion Rate',
            ),
            SizedBox(height: 10),
            VerticalInfoCard(
              textValue: '500000',
              textDescription: 'Monthly Earnings',
            ),
          ],
        ),
        createShowcaseTitle(
          'Two VerticalInfoCards side by side, each adapting to the available width.',
        ),
        const Row(
          children: [
            Flexible(
              child: VerticalInfoCard(
                textValue: '75%',
                textDescription: 'Project Completion',
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: VerticalInfoCard(
                textValue: '50%',
                textDescription: 'Task Progress',
              ),
            ),
          ],
        )
      ],
    );
  }
}
