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

import 'package:carmanager_ui/src/components/profile_menu_item/profile_menu_item.dart';
import 'package:carmanager_ui/src/components/profile_menu_item/profile_menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  testWidgets('Should render ProfileMenuItem with content and icon',
      (tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        ProfileMenuItem(
          item: ProfileMenuItemModel(
            content: 'Settings',
            onPressed: () {},
            icon: const Icon(Icons.settings, key: Key('settings-icon')),
          ),
        ),
      ),
    );

    expect(find.text('Settings'), findsOneWidget);
    expect(find.byKey(const Key('settings-icon')), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_ios_outlined), findsOneWidget);
  });

  testWidgets('Should truncate content if text exceeds maxLines',
      (tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        ProfileMenuItem(
          item: ProfileMenuItemModel(
            content:
                'A very long profile item content that should be truncated',
            onPressed: () {},
            icon: const Icon(Icons.info),
            maxLines: 1,
          ),
        ),
      ),
    );

    final textWidget =
        tester.widget<Text>(find.textContaining('A very long profile'));
    expect(textWidget.maxLines, 1);
    expect(textWidget.overflow, TextOverflow.ellipsis);
  });

  testWidgets('Should call onPressed when tapped', (tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      baseComponentApp(
        ProfileMenuItem(
          item: ProfileMenuItemModel(
            content: 'Logout',
            onPressed: () => tapped = true,
            icon: const Icon(Icons.logout),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(ProfileMenuItem));
    await tester.pump();

    expect(tapped, isTrue);
  });

  testWidgets('Should render correctly with multiple lines when maxLines > 1',
      (tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        ProfileMenuItem(
          item: ProfileMenuItemModel(
              content: 'Multi-line content test for overflow behavior',
              onPressed: () {},
              icon: const Icon(Icons.description),
              maxLines: 2),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.textContaining('Multi-line'));
    expect(textWidget.maxLines, 2);
  });
}
