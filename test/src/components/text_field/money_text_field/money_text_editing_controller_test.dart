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

import 'package:carmanager_ui/src/components/text_field/money_text_field/money_text_editing_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CMMoneyTextController', () {
    test('formats numbers when typing', () {
      final controller = CMMoneyTextController(
        thousandSeparator: '.',
        leftSymbol: '\$ ',
        rightSymbol: '',
      );

      controller.text = '1234.56';
      expect(controller.text, '\$ 123.456');

      controller.text = '1000000';
      expect(controller.text, '\$ 1.000.000');
    });

    test('numberValue returns correct numeric representation', () {
      final controller = CMMoneyTextController(
        thousandSeparator: '.',
        leftSymbol: '\$ ',
      );

      controller.text = '\$ 1.234';
      expect(controller.numberValue, 1234);

      controller.text = '\$ 100.000';
      expect(controller.numberValue, 100000);
    });

    test('hasError returns true for invalid input', () {
      final controller = CMMoneyTextController(leftSymbol: '\$ ');

      controller.text = '\$ ';
      expect(controller.hasError, true);

      controller.text = '\$ 0';
      expect(controller.hasError, true);

      controller.text = '\$ 10';
      expect(controller.hasError, false);
    });

    test('does not exceed 12 digits', () {
      final controller = CMMoneyTextController(
        thousandSeparator: '.',
        leftSymbol: '\$ ',
      );

      controller.text = '1234567890123';
      expect(controller.text, '\$ 0');

      controller.text = '123456789012';
      expect(controller.text, '\$ 123.456.789.012');
    });

    test('appends rightSymbol correctly', () {
      final controller = CMMoneyTextController(rightSymbol: ' USD');

      controller.text = '100';
      expect(controller.text, '\$ 100 USD');
    });

    test('maintains rightSymbol after text update', () {
      final controller = CMMoneyTextController(rightSymbol: ' USD');

      controller.text = '50';
      expect(controller.text, '\$ 50 USD');

      controller.text = '75';
      expect(controller.text, '\$ 75 USD');
    });

    test('does not duplicate rightSymbol when updating text', () {
      final controller = CMMoneyTextController(rightSymbol: ' USD');

      controller.text = '200 USD';
      expect(controller.text, '\$ 200 USD');

      controller.text = '300';
      expect(controller.text, '\$ 300 USD');
    });

    test('rightSymbol must not have numbers', () {
      expect(
        () => CMMoneyTextController(rightSymbol: 'USD1'),
        throwsArgumentError,
      );
    });

    test('executes super.value branch when already formatting', () {
      final controller = CMMoneyTextController();

      final value = controller.value;
      controller.value = value;
      controller.value = value;
      expect(controller.text, isNotEmpty);
    });
  });
}
