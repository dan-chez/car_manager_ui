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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

Widget baseAppBarApp(MockNavigator navigator, {String? assetName}) {
  return MaterialApp(
    home: MockNavigatorProvider(
      navigator: navigator,
      child: const Scaffold(
        appBar: CMAppbar(),
      ),
    ),
  );
}

void main() {
  group('CMAppbar', () {

    late MockNavigator navigator;

    setUp(() {
      navigator = MockNavigator();
      when(() => navigator.canPop()).thenReturn(true);
    });

    testWidgets('Should not display the asset image if assetName is null', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseAppBarApp(navigator),
      );

      final Finder svgImageFinder = find.byType(SvgPicture);

      expect(svgImageFinder, findsNothing);
    });

    testWidgets('Shows back button when canPop is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseAppBarApp(navigator),
      );

      final Finder iconFinder = find.byType(IconButton);

      expect(iconFinder, findsOne);
    });

    testWidgets('Don\'t show back button when canPop is false', (WidgetTester tester) async {

      when(() => navigator.canPop()).thenReturn(false);

      await tester.pumpWidget(
        baseAppBarApp(navigator),
      );

      final Finder iconFinder = find.byType(IconButton);

      expect(iconFinder, findsNothing);
    });

    testWidgets('Back button should call pop', (WidgetTester tester) async {
      await tester.pumpWidget(
        baseAppBarApp(navigator),
      );

      final Finder iconFinder = find.byType(IconButton);

      await tester.tap(iconFinder);

      verify(() => navigator.pop()).called(1);
    });
  });
}
