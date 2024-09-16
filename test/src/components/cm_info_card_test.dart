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

import 'base/base_component_app.dart';

void main() {
  testWidgets('Displays the correct icon and message', (WidgetTester tester) async {
    const testIcon = kMonitoringIcon;
    const testMessage = 'Test Info';

    await tester.pumpWidget(baseComponentApp(
      const CMInfoCard(
        icon: testIcon,
        message: testMessage,
      ),
    ));

    expect(find.byIcon(testIcon.icon!), findsOneWidget);
    expect(find.text(testMessage), findsOneWidget);
  });

  testWidgets('Handles long message with ellipsis', (WidgetTester tester) async {
    const testIcon = kDeleteIcon;
    const longMessage = 'This is a very long message that should be truncated';

    await tester.pumpWidget(baseComponentApp(
      const CMInfoCard(
        icon: testIcon,
        message: longMessage,
      ),
    ));

    final textFinder = find.text(longMessage);
    expect(textFinder, findsOneWidget);
    final Text textWidget = tester.widget(textFinder);
    expect(textWidget.overflow, TextOverflow.ellipsis);
  });

  testWidgets('Applies custom size to the card', (WidgetTester tester) async {
    const testIcon = kStarIcon;
    const testMessage = 'Custom Size';
    const customSize = Size(150, 180);

    await tester.pumpWidget(baseComponentApp(
      const CMInfoCard(
        icon: testIcon,
        message: testMessage,
        size: customSize,
      ),
    ));

    final baseSize = tester.getSize(find.byType(CMInfoCard));
    expect(baseSize.width, customSize.width);
    expect(baseSize.height, customSize.height);
  });
}
