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
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

import '../base/base_component_app.dart';

void main() {
  testWidgets('CMAnimation renders correctly with default values',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMAnimation('assets/sample_animation.json'),
      ),
    );

    expect(find.byType(Lottie), findsOneWidget);
  });

  testWidgets('CMAnimation applies width and height correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMAnimation(
          'assets/sample_animation.json',
          width: 200,
          height: 200,
        ),
      ),
    );

    final lottieWidget = tester.widget<Lottie>(find.byType(Lottie));

    expect(lottieWidget.width, 200);
    expect(lottieWidget.height, 200);
  });

  testWidgets('CMAnimation applies repeat, reverse, and animate properties',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMAnimation(
          'assets/sample_animation.json',
          repeat: true,
          reverse: true,
          animate: false,
        ),
      ),
    );

    final lottieWidget = tester.widget<Lottie>(find.byType(Lottie));

    expect(lottieWidget.repeat, true);
    expect(lottieWidget.reverse, true);
    expect(lottieWidget.animate, false);
  });
}
