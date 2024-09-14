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

import 'package:carmanager_ui/src/utils/extensions/number_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NumberExtension isProfit', () {
    test('should return true when the number is positive', () {
      const int value = 100;
      final result = value.isProfit;
      expect(result, isTrue);
    });

    test('should return true when the number is zero', () {
      const int value = 0;
      final result = value.isProfit;
      expect(result, isTrue);
    });

    test('should return false when the number is negative', () {
      const int value = -50;
      final result = value.isProfit;
      expect(result, isFalse);
    });
  });
}
