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

/// The [InfoCardShowcase] class demonstrates different styles and functionalities of the
/// [CMInfoCard] widget, offering a visual representation of how it can be used within the
/// application.
class InfoCardShowcase extends StatelessWidget {
  /// This path is used to navigate to the CMInfoCard showcase using GoRouter.
  static String path = '/infoCard';

  const InfoCardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'CMInfoCard showcase',
      children: [
        createShowcaseTitle(
          'Displays cards with various icons and messages, demonstrating different use cases for the CMInfoCard widget.',
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CMInfoCard(
              icon: kMonitoringIcon,
              message: 'Positive',
            ),
            CMInfoCard(
              icon: kSecurityIcon,
              message: 'Alerts',
            ),
          ],
        ),
        const SizedBox(height: 20),
        createShowcaseTitle(
          'Single info card with a specific icon and message.',
        ),
        const CMInfoCard(
          icon: kStarIcon,
          message: 'Top Rated',
        ),
        createShowcaseTitle('Info Cards with custom size'),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CMInfoCard(
              icon: kMonitoringIcon,
              message: 'Positive lorem dolor',
              size: Size(150, 120),
            ),
            CMInfoCard(
              icon: kSecurityIcon,
              message: 'Alerts',
              size: Size(110, 160),
            ),
          ],
        ),
      ],
    );
  }
}
