import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:carmanager_ui/src/components/buttons/close_icon_button.dart';
import 'package:carmanager_ui/src/components/dialogs/error/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  testWidgets('Close button visibility = true test', (WidgetTester tester) async {
    const dialogData = ErrorDialogData(title: 'Title', subtitle: 'Subtitle', titleBoldPositions: [], imagePath: '');
    await tester.pumpWidget(
      baseComponentApp(const ErrorDialog(data: dialogData)),
    );

    expect(find.byType(CloseIconButton), findsOneWidget);
  });

  testWidgets('Invalid image data test', (WidgetTester tester) async {
    const dialogData = ErrorDialogData(title: 'Title', subtitle: 'Subtitle', titleBoldPositions: [], imagePath: '');

    await tester.pumpWidget(
      baseComponentApp(const ErrorDialog(data: dialogData)),
    );

    expect(find.byType(SvgPicture), findsNothing);
  });

  testWidgets('Dialog transition test, Verify dialog is displayed', (WidgetTester tester) async {
    const dialogData = ErrorDialogData(title: 'Title', subtitle: 'Subtitle', titleBoldPositions: [], imagePath: '');

    await tester.pumpWidget(
      baseComponentApp(const ErrorDialog(data: dialogData)),
    );

    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
  });
}
