import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/utils/cm_raw_dialog_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../components/base/base_component_app.dart';

void main() {
  testWidgets('createRawDialogRoute returns a valid RawDialogRoute',
      (WidgetTester tester) async {
    final testWidget = baseComponentApp(
      Builder(
        builder: (context) => ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              createRawDialogRoute(
                settings: const RouteSettings(name: 'test_dialog'),
                child: const Text('Test Dialog'),
              ),
            );
          },
          child: const Text('Open Dialog'),
        ),
      ),
    );

    await tester.pumpWidget(testWidget);

    await tester.tap(find.text('Open Dialog'));
    await tester.pumpAndSettle();

    expect(find.text('Test Dialog'), findsOneWidget);

    final Route<dynamic>? currentRoute =
        ModalRoute.of(tester.element(find.text('Test Dialog')));

    expect(currentRoute, isA<RawDialogRoute>());

    final RawDialogRoute rawDialogRoute = currentRoute as RawDialogRoute;
    expect(rawDialogRoute.settings.name, 'test_dialog');
    expect(rawDialogRoute.barrierColor, kBarrierColor);
    expect(
        rawDialogRoute.transitionDuration, const Duration(milliseconds: 200));
    expect(find.byType(SizedBox), findsNothing);
  });
}
