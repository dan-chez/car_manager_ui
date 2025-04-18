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

/// The [DateButtonShowcase] class provides a visual representation of various date buttons.
class DateButtonShowcase extends StatelessWidget {
  /// This path is used to navigate to the button showcase using GoRouter.
  static String path = '/dateButton';

  const DateButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowcaseAppBase(
      title: 'Date button showcase',
      children: [
        createShowcaseTitle('CMDateButton', higherSize: true),
        createShowcaseTitle('Basic configuration'),
        CMDateButton(
          txtLabel: 'February 2025',
          hintText: 'Month',
          onPressed: () {
            printValue('Button pressed');
          },
        ),
        createShowcaseTitle('Basic configuration with custom icon'),
        CMDateButton(
          txtLabel: 'February 2025',
          hintText: 'Month',
          onPressed: () {
            printValue('Button pressed');
          },
          icon: kAddExpenseIconRed,
        )
      ],
    );
  }
}
