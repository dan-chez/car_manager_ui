import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:carmanager_ui/src/components/buttons/close_icon_button.dart';
import 'package:carmanager_ui/src/components/dialogs/confirm/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  testWidgets('Close button visibility = true test', (WidgetTester tester) async {
    const dialogData = ConfirmDialogData(message: 'Message', buttonText: 'Button', showCloseButton: true);
    await tester.pumpWidget(
      baseComponentApp(const ConfirmDialog(data: dialogData)),
    );

    expect(find.byType(CloseIconButton), findsOneWidget);
  });

  testWidgets('Close button visibility = false test', (WidgetTester tester) async {
    const dialogData = ConfirmDialogData(message: 'Message', buttonText: 'Button', showCloseButton: false);
    await tester.pumpWidget(
      baseComponentApp(const ConfirmDialog(data: dialogData)),
    );

    expect(find.byType(CloseIconButton), findsNothing);
  });

  testWidgets('Button press triggers onPressed callback', (WidgetTester tester) async {
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

  testWidgets('Dialog transition test, Verify dialog is displayed', (WidgetTester tester) async {
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
}
