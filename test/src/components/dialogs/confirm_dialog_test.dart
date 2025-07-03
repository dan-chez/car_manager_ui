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
import 'package:carmanager_ui/src/components/dialogs/confirm/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../base/base_component_app.dart';

void main() {
  late MockNavigator mockNavigator;

  setUp(() {
    mockNavigator = MockNavigator();
  });

  testWidgets('Close button visibility = true test',
      (WidgetTester tester) async {
    const dialogData = ConfirmDialogData(
        message: 'Message', buttonText: 'Button', showCloseButton: true);
    await tester.pumpWidget(
      baseComponentApp(const ConfirmDialog(data: dialogData)),
    );

    expect(find.byType(CloseIconButton), findsOneWidget);
  });

  testWidgets('Close button visibility = false test',
      (WidgetTester tester) async {
    const dialogData = ConfirmDialogData(
        message: 'Message', buttonText: 'Button', showCloseButton: false);
    await tester.pumpWidget(
      baseComponentApp(const ConfirmDialog(data: dialogData)),
    );

    expect(find.byType(CloseIconButton), findsNothing);
  });

  testWidgets('Button press triggers onPressed callback',
      (WidgetTester tester) async {
    bool wasPressed = false;
    final dialogData = ConfirmDialogData(
      message: '',
      buttonText: 'Confirm',
      popWhenOnPressed: false,
      onPressed: () => wasPressed = true,
    );

    await tester.pumpWidget(
      baseComponentApp(ConfirmDialog(data: dialogData)),
    );

    await tester.tap(find.text('Confirm'));
    expect(wasPressed, isTrue);
  });

  testWidgets('Invalid image data test', (WidgetTester tester) async {
    const dialogData = ConfirmDialogData(
      message: '',
      buttonText: 'Confirm',
      popWhenOnPressed: false,
      image: null,
    );

    await tester.pumpWidget(
      baseComponentApp(const ConfirmDialog(data: dialogData)),
    );

    expect(find.byType(SvgPicture), findsNothing);
  });

  testWidgets('Dialog transition test, Verify dialog is displayed',
      (WidgetTester tester) async {
    const dialogData = ConfirmDialogData(
      message: '',
      buttonText: 'Confirm',
      popWhenOnPressed: false,
      image: null,
    );

    await tester.pumpWidget(
      baseComponentApp(const ConfirmDialog(data: dialogData)),
    );

    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
  });

  testWidgets(
    'ConfirmDialog should pop when popWhenOnPressed is true',
    (WidgetTester tester) async {
      when(() => mockNavigator.canPop()).thenReturn(true);
      await tester.pumpWidget(
        baseComponentApp(
          MockNavigatorProvider(
            navigator: mockNavigator,
            child: Builder(
              builder: (context) => ConfirmDialog(
                data: ConfirmDialogData(
                  message: 'Are you sure?',
                  buttonText: 'Confirm',
                  popWhenOnPressed: true,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(PrimaryButton));
      await tester.pumpAndSettle();

      verify(() => mockNavigator.pop()).called(1);
    },
  );

  testWidgets('Title is displayed when provided', (WidgetTester tester) async {
    const testTitle = 'Test Title';
    const dialogData = ConfirmDialogData(
      title: testTitle,
      message: 'Message',
      buttonText: 'Button',
    );
    await tester.pumpWidget(
      baseComponentApp(const ConfirmDialog(data: dialogData)),
    );

    expect(find.text(testTitle), findsOneWidget);
  });

  testWidgets('Title is not displayed when not provided',
      (WidgetTester tester) async {
    const dialogData = ConfirmDialogData(
      message: 'Message',
      buttonText: 'Button',
      title: null,
    );
    await tester.pumpWidget(
      baseComponentApp(const ConfirmDialog(data: dialogData)),
    );

    final titleVisibilityFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Visibility &&
          widget.child is Padding &&
          (widget.child as Padding).child is Text &&
          !widget.visible,
    );
    expect(titleVisibilityFinder, findsWidgets);
  });
}
