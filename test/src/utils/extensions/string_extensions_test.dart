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

import 'package:carmanager_ui/src/utils/extensions/string_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String extension parseToInt', () {
    test('should return an integer when the string is a valid number', () {
      const String value = '123';
      final result = value.parseToInt;
      expect(result, 123);
    });

    test('should return 0 when the string is empty', () {
      const String value = '';
      final result = value.parseToInt;
      expect(result, 0);
    });

    test('should return 0 when the string contains non-numeric characters', () {
      const String value = 'abc123';
      final result = value.parseToInt;
      expect(result, 0);
    });

    test('should return 0 when the string is purely non-numeric', () {
      const String value = 'abc';
      final result = value.parseToInt;
      expect(result, 0);
    });

    test('should correctly parse negative numbers', () {
      const String value = '-456';
      final result = value.parseToInt;
      expect(result, -456);
    });

    test('should return 0 for a string with a floating point number', () {
      const String value = '123.45';
      final result = value.parseToInt;
      expect(result, 0);
    });

    test('should return 0 for a string with special characters', () {
      const String value = '!@#123';
      final result = value.parseToInt;
      expect(result, 0);
    });
  });

  group('FormattedNumberExtension', () {
    test('should format a valid number string to currency format', () {
      const String amount = '150000';
      final formatted = amount.toMoneyFormat;
      expect(formatted, equals('\$ 150.000'));
    });

    test('should return \$ 0 if the string is empty', () {
      const String amount = '';
      final formatted = amount.toMoneyFormat;
      expect(formatted, equals('\$ 0'));
    });

    test('should return \$ 0 if the string is not a valid number', () {
      const String amount = 'abc123';
      final formatted = amount.toMoneyFormat;
      expect(formatted, equals('\$ 0'));
    });

    test('should return correct format with smaller numbers', () {
      const String amount = '123';
      final formatted = amount.toMoneyFormat;
      expect(formatted, equals('\$ 123'));
    });
  });
}
