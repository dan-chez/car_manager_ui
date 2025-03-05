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

  testWidgets('LoadingDialog uses the correct properties',
      (WidgetTester tester) async {
    const loadingDialogData = LoadingDialogData(
      height: CMDimens.d150,
      width: CMDimens.d150,
      lottieAssetPath: '',
    );

    await tester.pumpWidget(
      baseComponentApp(
        const LoadingDialog(data: loadingDialogData),
      ),
    );

    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
    expect(sizedBox.height, CMDimens.d150);
    expect(sizedBox.width, CMDimens.d150);
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
