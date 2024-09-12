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

import 'package:carmanager_ui/src/components/cm_brief_card.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base/base_component_app.dart';

void main() {
  testWidgets('Displays title and description correctly', (WidgetTester tester) async {
    const title = 'Test Title';
    const description = 'Test Description';

    await tester.pumpWidget(baseComponentApp(
      CMBriefCard(
        title: title,
        description: description,
        onPressed: () {},
      ),
    ));

    expect(find.text(title), findsOneWidget);
    expect(find.text(description), findsOneWidget);
  });

  testWidgets('Does not display icon when cardIcon is null', (WidgetTester tester) async {
    await tester.pumpWidget(baseComponentApp(
      CMBriefCard(
        title: 'Test Title',
        description: 'Test Description',
        onPressed: () {},
        iconPath: null,
      ),
    ));

    expect(find.byType(SvgPicture), findsNothing);
  });

  testWidgets('Button is disabled when isEnabled is false', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(baseComponentApp(
      CMBriefCard(
        title: 'Test Title',
        description: 'Test Description',
        onPressed: () {
          pressed = true;
        },
        isEnabled: false,
      ),
    ));

    await tester.tap(find.byType(TextButton));
    expect(pressed, false);
  });

  testWidgets('Button is enabled when isEnabled is true', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(baseComponentApp(
      CMBriefCard(
        title: 'Test Title',
        description: 'Test Description',
        onPressed: () {
          pressed = true;
        },
        isEnabled: true,
      ),
    ));

    await tester.tap(find.byType(TextButton));
    expect(pressed, true);
  });

  testWidgets('Correct colors for enabled and disabled states', (WidgetTester tester) async {
    await tester.pumpWidget(baseComponentApp(
      Column(
        children: [
          CMBriefCard(
            title: 'Enabled Card',
            description: 'Description',
            onPressed: () {},
            isEnabled: true,
          ),
          CMBriefCard(
            title: 'Disabled Card',
            description: 'Description',
            onPressed: () {},
            isEnabled: false,
          ),
        ],
      ),
    ));

    final enabledTitleStyle = tester.widget<Text>(find.text('Enabled Card')).style;
    final disabledTitleStyle = tester.widget<Text>(find.text('Disabled Card')).style;

    expect(enabledTitleStyle?.color, kMyrtleGreen);
    expect(disabledTitleStyle?.color, kSilver);
  });
}
