import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:carmanager_ui/src/components/dialogs/loading/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

import '../base/base_component_app.dart';

void main() {
  testWidgets('LoadingDialog renders correctly', (WidgetTester tester) async {
    const loadingDialogData = LoadingDialogData(
      lottieAssetPath: '',
    );

    await tester.pumpWidget(
      baseComponentApp(
        const LoadingDialog(data: loadingDialogData),
      ),
    );

    expect(find.byType(Lottie), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(SizedBox), findsOneWidget);
  });

  testWidgets('LoadingDialog uses the correct properties', (WidgetTester tester) async {
    const loadingDialogData = LoadingDialogData(
      height: 150,
      width: 150,
      lottieAssetPath: '',
    );

    await tester.pumpWidget(
      baseComponentApp(
        const LoadingDialog(data: loadingDialogData),
      ),
    );

    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
    expect(sizedBox.height, 150);
    expect(sizedBox.width, 150);
  });

  testWidgets('LoadingDialog prevents popping', (WidgetTester tester) async {
    const loadingDialogData = LoadingDialogData(
      lottieAssetPath: '',
    );

    await tester.pumpWidget(
      baseComponentApp(
        const LoadingDialog(data: loadingDialogData),
      ),
    );

    final popScope = tester.widget<PopScope>(find.byType(PopScope));
    expect(popScope.canPop, isFalse);
  });
}
