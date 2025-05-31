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

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carmanager_ui/src/components/cm_info_panel.dart';
import 'package:carmanager_ui/src/constants/cm_icons.dart';

import '../utils/finders.dart';
import 'base/base_component_app.dart';

void main() {
  testWidgets('Renders with default icon and text', (tester) async {
    const content = 'Hello|world';

    await tester.pumpWidget(
      baseComponentApp(const CMInfoPanel(content: content)),
    );

    expect(find.byWidget(kInfoIcon), findsOneWidget);

    expect(findRichTextBySubstring('Hello'), findsOneWidget);
    expect(findRichTextBySubstring('world'), findsOneWidget);
  });

  testWidgets('Applies bold formatting to specified positions', (tester) async {
    const content = 'One|Two|Three';

    await tester.pumpWidget(
      baseComponentApp(
        const CMInfoPanel(content: content, boldPositions: [1]),
      ),
    );

    final rt = tester.widget<RichText>(findRichTextBySubstring('One'));
    final spans = (rt.text as TextSpan).children!.cast<TextSpan>();

    expect(spans.length, 3);

    expect(spans[1].text?.trim(), 'Two');
    expect(spans[1].style?.fontWeight, FontWeight.w700);

    expect(spans[0].style?.fontWeight, equals(FontWeight.w400));
    expect(spans[2].style?.fontWeight, equals(FontWeight.w400));
  });

  testWidgets('Respects maxLines property', (tester) async {
    const content = 'A|B|C';

    await tester.pumpWidget(
      baseComponentApp(
        const CMInfoPanel(content: content, maxLines: 2),
      ),
    );

    final rt = tester.widget<RichText>(findRichTextBySubstring('A'));
    expect(rt.maxLines, equals(2));
  });

  testWidgets('Displays custom icon when provided', (tester) async {
    const content = 'Tip|point';
    final customIcon = Icon(Icons.warning, key: const Key('warn_icon'));

    await tester.pumpWidget(
      baseComponentApp(
        CMInfoPanel(content: content, icon: customIcon),
      ),
    );

    expect(find.byKey(const Key('warn_icon')), findsOneWidget);
    expect(find.byWidget(kInfoIcon), findsNothing);
  });

  testWidgets('Handles text overflow correctly', (tester) async {
    const content = 'Long|overflow|text';

    await tester.pumpWidget(
      baseComponentApp(
        const CMInfoPanel(content: content, maxLines: 1),
      ),
    );

    final rt = tester.widget<RichText>(findRichTextBySubstring('Long'));
    expect(rt.overflow, equals(TextOverflow.ellipsis));
  });
}
