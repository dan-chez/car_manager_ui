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

import 'package:intl/intl.dart';

extension StringExtension on String {
  /// This extension provides a method to handle numeric conversion, ensuring that
  /// invalid or non-numeric strings are converted to a default value of `0`, preventing
  /// potential runtime exceptions.
  ///
  /// Example:
  /// ```dart
  /// '123'.parseToInt;     // Returns: 123
  /// 'abc'.parseToInt;     // Returns: 0
  /// '123abc'.parseToInt;  // Returns: 0
  /// ```
  int get parseToInt => int.tryParse(this) ?? 0;

  /// Converts a [String] representing a number into a formatted currency string.
  ///
  /// The resulting format:
  /// - Uses the dollar sign (`$ `) as the currency symbol.
  /// - Does not include decimal digits (rounded to the nearest integer).
  /// - Replaces commas used for thousands with dots.
  ///
  /// Example:
  /// ```dart
  /// '150000'.toMoneyFormat;  // Returns: $ 150.000
  /// 'abc'.toMoneyFormat;     // Returns: $ 0
  /// ```
  String get toMoneyFormat {
    final formatter = NumberFormat.currency(
      symbol: '\$ ',
      decimalDigits: 0,
    );
    return formatter.format(parseToInt).replaceAll(',', '.');
  }
}
