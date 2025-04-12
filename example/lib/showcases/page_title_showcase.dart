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

/// The [PageTitleShowcase] class provides a visual representation of [CMPageTitle]
class PageTitleShowcase extends StatelessWidget {
  /// This path is used to navigate to the textField showcase using GoRouter.
  static String path = '/pageTitle';

  const PageTitleShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'PageTitle showcase',
      children: [
        createShowcaseTitle('CMPageTitle', higherSize: true),
        createShowcaseTitle(
            'The `CMPageTitle` widget is designed to display a page title with a combination of light and bold text. It provides options to customize the text and include an optional bottom divider.'),
        const CMPageTitle(
          lightTitle: 'Welcome to',
          boldTitle: 'Flutter',
          showBottomDivider: true,
        ),
        createShowcaseTitle('Without bottom divider.'),
        const CMPageTitle(
          lightTitle: 'Getting Started with',
          boldTitle: 'Dart',
          showBottomDivider: false,
        ),
        createShowcaseTitle('Long text example.'),
        const CMPageTitle(
          lightTitle:
              'This is a very long title that will be truncated if it exceeds the maximum number of lines.',
          boldTitle:
              'Flutter Showcase Large Title Example with Long Text and Truncation',
          showBottomDivider: true,
        ),
        createShowcaseTitle('Example text with edit icon.'),
        const CMPageTitle(
          lightTitle: 'Create report',
          boldTitle: 'Dart',
          showBottomDivider: true,
          showEditIcon: true,
        ),
        createShowcaseTitle('Long text example with edit icon.'),
        const CMPageTitle(
          lightTitle:
              'This is a very long title that will be truncated if it exceeds the maximum number of lines.',
          boldTitle:
              'Flutter Showcase Large Title Example with Long Text and Truncation',
          showBottomDivider: true,
          showEditIcon: true,
        ),
      ],
    );
  }
}
