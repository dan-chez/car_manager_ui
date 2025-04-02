import 'package:carmanager_ui/src/components/buttons/close_icon_button.dart';
import 'package:carmanager_ui/src/components/buttons/primary_button.dart';
import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/car_picker_dialog.dart';
import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/car_picker_items.dart';
import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/data/car_picker_dialog_data.dart';
import 'package:carmanager_ui/src/components/dialogs/car_picker_dialog/data/car_picker_item_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../base/base_component_app.dart';

void main() {
  late CarPickerDialogData mockData;
  late MockNavigator mockNavigator;
  late Function onButtonPressed;
  bool onButtonPressedCalled = false;

  setUp(() {
    onButtonPressed = () {
      onButtonPressedCalled = !onButtonPressedCalled;
    };
    mockData = CarPickerDialogData(
      title: 'Select a Car',
      buttonText: 'Confirm',
      items: [
        CarPickerItemData(
          id: '1',
          name: 'Car 1',
          plate: 'Plate:|13',
        ),
        CarPickerItemData(
          id: '2',
          name: 'Car 2',
          plate: 'Plate:|34',
        ),
      ],
      selectedId: '1',
      onItemSelected: (item) {},
      onButtonPressed: onButtonPressed,
    );
    mockNavigator = MockNavigator();
    when(() => mockNavigator.canPop()).thenReturn(true);
  });

  Widget createTestWidget() {
    return baseComponentApp(
      MockNavigatorProvider(
        navigator: mockNavigator,
        child: Builder(
          builder: (context) => CarPickerDialog(data: mockData),
        ),
      ),
    );
  }

  testWidgets('CarPickerDialog renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    expect(find.byType(CloseIconButton), findsOneWidget);
    expect(find.text('Select a Car'), findsOneWidget);
    expect(find.byType(CarPickerItems), findsOneWidget);
    expect(find.byType(PrimaryButton), findsOneWidget);
  });

  testWidgets('Tapping CloseIconButton dismisses the dialog',
      (WidgetTester tester) async {
    when(() => mockNavigator.canPop()).thenReturn(true);
    await tester.pumpWidget(createTestWidget());

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    verify(() => mockNavigator.pop()).called(1);
  });

  testWidgets(
      'Tapping PrimaryButton dismisses the dialog and call buttonCallback',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    expect(onButtonPressedCalled, false);

    await tester.tap(find.byType(PrimaryButton));
    await tester.pumpAndSettle();

    verify(() => mockNavigator.pop()).called(1);
    expect(onButtonPressedCalled, true);
  });
}
