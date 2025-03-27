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
  testWidgets('WarningInfo calls onDismissed when tapped', (WidgetTester tester) async {
    bool wasDismissed = false;

    final widget = WarningInfo(
      message: 'This is|important|info',
      boldPositions: [1],
      onDismissed: () {
        wasDismissed = true;
      },
    );

    await tester.pumpWidget(baseComponentApp(widget));
    await tester.tap(find.byType(WarningInfo));
    await tester.pumpAndSettle();

    expect(wasDismissed, isTrue);
  });

  testWidgets('WarningInfo renders text with bold segment', (WidgetTester tester) async {
    final widget = WarningInfo(
      message: 'Alert:|System failure|Please restart.',
      boldPositions: [1],
    );

    await tester.pumpWidget(baseComponentApp(widget));

    final richText = find.byWidgetPredicate((widget) {
      return widget is RichText && widget.text.toPlainText().contains('System failure');
    });

    expect(richText, findsOneWidget);
  });

  testWidgets('WarningInfo disappears after tap', (WidgetTester tester) async {
    final widget = WarningInfo(
      message: 'Tap to dismiss this warning',
    );

    await tester.pumpWidget(baseComponentApp(widget));
    await tester.tap(find.byType(WarningInfo));
    await tester.pump(const Duration(milliseconds: 600));

    expect(find.textContaining('Tap to dismiss'), findsNothing);
  });
}
