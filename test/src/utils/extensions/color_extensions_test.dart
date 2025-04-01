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

import 'package:carmanager_ui/src/utils/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorExtension - withOpacityValue', () {

    const Color testColor = Color(0xFFFF0000);

    test('Opacity 0.0 should result in fully transparent testColor', () {
      final result = testColor.withOpacityValue(0.0);

      expect(result.a, 0);
    });

    test('Opacity 1.0 should keep the testColor fully opaque', () {

      final result = testColor.withOpacityValue(1.0);

      expect(result.a, 1);
    });

    test('Opacity 0.5 should set a to 0.5019607843137255', () {

      final result = testColor.withOpacityValue(0.5);

      expect(result.a, 0.5019607843137255);
    });

    test('Opacity 0.75 should set a to 0.7490196078431373', () {

      final result = testColor.withOpacityValue(0.75);

      expect(result.a, 0.7490196078431373);
    });

    test('Opacity greater than 1.0 should throw an ArgumentError', () {

      expect(() => testColor.withOpacityValue(1.1), throwsArgumentError);
    });
  });
}
