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

import 'package:flutter/material.dart';

class CMMoneyTextController extends TextEditingController {
  CMMoneyTextController({
    this.thousandSeparator = '.',
    this.rightSymbol = '',
    this.leftSymbol = '\$ ',
  }) {
    _validateConfig();
    super.text = '${leftSymbol}0';
  }

  final String thousandSeparator;
  final String rightSymbol;
  final String leftSymbol;

  bool _isFormatting = false;
  double _lastValue = 0.0;

  static final RegExp _nonDigits = RegExp(r'[^0-9]');

  @override
  set value(TextEditingValue newValue) {
    if (_isFormatting) {
      super.value = newValue;
      return;
    }

    _isFormatting = true;

    final formatted = _formatInput(newValue.text);
    final cursor = formatted.length;

    super.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: cursor),
      composing: TextRange.empty,
    );

    _isFormatting = false;
  }

  String _formatInput(String input) {
    final numbers = _getOnlyNumbers(input);
    if (numbers.isEmpty) {
      _lastValue = 0.0;
      return _applyMaskWithSymbols(0.0);
    }

    if (numbers.length > 12) return _applyMaskWithSymbols(_lastValue);

    final parsed = double.tryParse(numbers) ?? 0.0;
    _lastValue = parsed;
    return _applyMaskWithSymbols(parsed);
  }

  String _applyMask(double value) {
    final digitsReversed = value
        .toStringAsFixed(0)
        .replaceAll('.', '')
        .split('')
        .reversed
        .toList();

    if (thousandSeparator.isNotEmpty) {
      for (var i = 3; i < digitsReversed.length; i += 4) {
        digitsReversed.insert(i, thousandSeparator);
      }
    }

    return digitsReversed.reversed.join('');
  }

  String _applyMaskWithSymbols(double value) {
    var masked = _applyMask(value);
    if (rightSymbol.isNotEmpty) masked += rightSymbol;
    if (leftSymbol.isNotEmpty) masked = leftSymbol + masked;
    return masked;
  }

  String _getOnlyNumbers(String text) => text.replaceAll(_nonDigits, '');

  void _validateConfig() {
    if (_getOnlyNumbers(rightSymbol).isNotEmpty) {
      throw ArgumentError('rightSymbol must not have numbers');
    }
  }

  bool get hasError => text.isEmpty || text == '\$ ' || text == '\$ 0';

  double get numberValue {
    final digits = _getOnlyNumbers(text);
    if (digits.isEmpty) return 0.0;
    return double.tryParse(digits) ?? 0.0;
  }

  String get finalValue => hasError ? '' : numberValue.toInt().toString();
}
