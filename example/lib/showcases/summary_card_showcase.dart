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

/// The [SummaryCardShowcase] class demonstrates different styles and functionalities of the
/// [CMSummaryCard] widget, offering a visual representation of how it can be used within the
/// application.
class SummaryCardShowcase extends StatelessWidget {
  /// This path is used to navigate to the CMSummaryCard showcase using GoRouter.
  static String path = '/summaryCard';

  const SummaryCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'CMSummaryCard showcase',
      children: [
        createShowcaseTitle(
          'Summary card showcasing profit and loss with conditional styling.',
        ),
        const CMSummaryCard(
          text: 'Total Revenue',
          profit: '500000',
        ),
        const SizedBox(height: 20),
        const CMSummaryCard(
          text: 'Net Loss',
          profit: '-100000',
        ),
        createShowcaseTitle(
          'Displays two CMSummaryCard widgets showcasing a positive profit and a negative profit.',
        ),
        const Row(
          children: [
            Flexible(
              child: CMSummaryCard(
                text: 'Total',
                profit: '23000000',
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: CMSummaryCard(
                text: 'Loss',
                profit: '-100000',
              ),
            ),
          ],
        )
      ],
    );
  }
}
