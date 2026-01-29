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

import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  test('Constructor creates instance with correct properties', () {
    const pageTitle = CMPageTitle(
      lightTitle: 'Light',
      boldTitle: 'Bold',
      showBottomDivider: true,
      showEditIcon: false,
    );

    expect(pageTitle.lightTitle, 'Light');
    expect(pageTitle.boldTitle, 'Bold');
    expect(pageTitle.showBottomDivider, true);
    expect(pageTitle.showEditIcon, false);
  });

  testWidgets('Displays both light and bold titles correctly',
      (WidgetTester tester) async {
    const lightTitle = 'Welcome to';
    const boldTitle = 'Flutter';

    await tester.pumpWidget(
      baseComponentApp(
        const CMPageTitle(
          lightTitle: lightTitle,
          boldTitle: boldTitle,
        ),
      ),
    );

    expect(find.text(lightTitle), findsOneWidget);
    expect(find.text(boldTitle), findsOneWidget);
  });

  testWidgets('Applies correct text styles to light and bold titles',
      (WidgetTester tester) async {
    const lightTitle = 'Hello';
    const boldTitle = 'World';

    await tester.pumpWidget(
      baseComponentApp(
        const CMPageTitle(
          lightTitle: lightTitle,
          boldTitle: boldTitle,
        ),
      ),
    );

    final lightTitleText = tester.widget<Text>(find.text(lightTitle));
    final boldTitleText = tester.widget<Text>(find.text(boldTitle));

    expect(lightTitleText.style?.fontWeight, FontWeight.w300);
    expect(boldTitleText.style?.fontWeight, FontWeight.w600);
  });

  testWidgets('Displays bottom divider when showBottomDivider is true',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        const CMPageTitle(
          lightTitle: 'Hello',
          boldTitle: 'World',
          showBottomDivider: true,
        ),
      ),
    );

    expect(find.byType(Divider), findsOneWidget);
  });

  testWidgets('Does not display bottom divider when showBottomDivider is false',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        const CMPageTitle(
          lightTitle: 'Hello',
          boldTitle: 'World',
          showBottomDivider: false,
        ),
      ),
    );

    expect(find.byType(Divider), findsNothing);
  });

  testWidgets('Displays edit icon when showEditIcon is true',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        const CMPageTitle(
          lightTitle: 'Hello',
          boldTitle: 'World',
          showBottomDivider: false,
          showEditIcon: true,
        ),
      ),
    );

    expect(find.byType(Icon), findsOneWidget);
  });

  testWidgets('Does not display edit icon when showEditIcon is false',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        const CMPageTitle(
          lightTitle: 'Hello',
          boldTitle: 'World',
          showEditIcon: false,
        ),
      ),
    );

    expect(find.byType(Icon), findsNothing);
  });
}
