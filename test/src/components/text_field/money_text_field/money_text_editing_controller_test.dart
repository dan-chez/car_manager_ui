import 'package:carmanager_ui/src/components/text_field/money_text_field/money_text_editing_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CMMoneyTextController', () {
    test('updateValue should format numbers correctly', () {
      final controller = CMMoneyTextController(
        decimalSeparator: ',',
        thousandSeparator: '.',
        leftSymbol: '\$ ',
        rightSymbol: '',
        precision: 2,
      );

      controller.updateValue(1234.56);
      expect(controller.text, '\$ 1.234,56');

      controller.updateValue(1000000);
      expect(controller.text, '\$ 1.000.000,00');
    });

    test('numberValue should return the correct numeric representation', () {
      final controller = CMMoneyTextController(
        decimalSeparator: ',',
        thousandSeparator: '.',
        leftSymbol: '\$ ',
        precision: 2,
      );

      controller.text = '\$ 1.234,56';
      expect(controller.numberValue, 1234.56);

      controller.text = '\$ 100.000,99';
      expect(controller.numberValue, 100000.99);
    });

    test('hasError should return true for invalid input', () {
      final controller = CMMoneyTextController(
        leftSymbol: '\$ ',
      );

      controller.text = '\$ ';
      expect(controller.hasError, true);

      controller.text = '\$ 0';
      expect(controller.hasError, true);

      controller.text = '\$ 10';
      expect(controller.hasError, false);
    });

    test('updateValue should not exceed 12 digits before decimal', () {
      final controller = CMMoneyTextController(
        decimalSeparator: ',',
        thousandSeparator: '.',
        leftSymbol: '\$ ',
        precision: 2,
      );

      controller.updateValue(1234567890123);
      expect(controller.text, '\$ 0,00');

      controller.updateValue(123456789012);
      expect(controller.text, '\$ 123.456.789.012,00');
    });

    test('should append rightSymbol correctly', () {
      final controller = CMMoneyTextController(rightSymbol: ' USD');

      controller.text = '100';

      expect(controller.text, equals('\$ 100 USD'));
    });

    test('should maintain rightSymbol after text update', () {
      final controller = CMMoneyTextController(rightSymbol: ' USD');

      controller.text = '50';

      expect(controller.text, equals('\$ 50 USD'));

      controller.text = '75';

      expect(controller.text, equals('\$ 75 USD'));
    });

    test('should not duplicate rightSymbol when updating text', () {
      final controller = CMMoneyTextController(rightSymbol: ' USD');

      controller.text = '200 USD';

      expect(controller.text, equals('\$ 200 USD'));

      controller.text = '300';

      expect(controller.text, equals('\$ 300 USD'));
    });

    test('rightSymbol must not have numbers', () {
      expect(
        () => CMMoneyTextController(rightSymbol: 'USD1'),
        throwsArgumentError,
      );
    });
  });
}
