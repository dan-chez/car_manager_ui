import 'package:carmanager_ui/src/components/dropdown/cm_dropdown.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base/base_component_app.dart';

void main() {
  testWidgets('Dropdown renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMDropdown(
          items: const {'1': 'Option 1', '2': 'Option 2'},
          labelText: 'Select an option',
          hintText: 'Please select',
          disabledHintText: 'No options available',
          onItemSelected: (value, key) {},
        ),
      ),
    );

    expect(find.text('Select an option'), findsOneWidget);
    expect(find.text('Please select'), findsOneWidget);
  });

  testWidgets('Dropdown disabled when items empty', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseComponentApp(
        CMDropdown(
          items: const {},
          labelText: 'Select an option',
          hintText: 'Please select',
          disabledHintText: 'No options available',
          onItemSelected: (value, key) {},
        ),
      ),
    );

    expect(find.text('No options available'), findsOneWidget);
  });

  testWidgets('Item selection triggers callback', (WidgetTester tester) async {
    String? selectedValue;
    String? selectedKey;

    await tester.pumpWidget(
      baseComponentApp(
        CMDropdown(
          items: const {'1': 'Option 1', '2': 'Option 2'},
          labelText: 'Select an option',
          hintText: 'Please select',
          disabledHintText: 'No options available',
          onItemSelected: (value, key) {
            selectedValue = value;
            selectedKey = key;
          },
        ),
      ),
    );

    await tester.tap(find.byType(CMDropdown));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Option 1').last);
    await tester.pumpAndSettle();

    expect(selectedValue, 'Option 1');
    expect(selectedKey, '1');
  });
}
