import 'package:flutter/material.dart';

class CMMoneyTextController extends TextEditingController {
  CMMoneyTextController(
      {double initialValue = 0.0,
        this.decimalSeparator = '',
        this.thousandSeparator = '.',
        this.rightSymbol = '',
        this.leftSymbol = '\$ ',
        this.precision = 0}) {
    _validateConfig();

    addListener(() {
      updateValue(numberValue);
    });
  }

  final String decimalSeparator;
  final String thousandSeparator;
  final String rightSymbol;
  final String leftSymbol;
  final int precision;

  double _lastValue = 0.0;

  void updateValue(double value) {
    double valueToUse = value;

    if (value.toStringAsFixed(0).length > 12) {
      valueToUse = _lastValue;
    } else {
      _lastValue = value;
    }

    String masked = _applyMask(valueToUse);

    if (rightSymbol.isNotEmpty) {
      masked += rightSymbol;
    }

    if (leftSymbol.isNotEmpty) {
      masked = leftSymbol + masked;
    }

    if (masked != text) {
      text = masked;

      var cursorPosition = super.text.length - rightSymbol.length;
      selection = TextSelection.fromPosition(TextPosition(offset: cursorPosition));
    }
  }

  double get numberValue {
    List<String> parts = _getOnlyNumbers(text).split('').toList(growable: true);

    parts.insert(parts.length - precision, '.');

    if (parts.join() == '.') {
      return double.parse('0');
    } else {
      return double.parse(parts.join());
    }
  }

  bool get hasError {
    return (text.isEmpty) || (text == '\$ 0') || (text == '\$ ');
  }

  String get finalValue {
    if (hasError) {
      return '';
    } else {
      return numberValue.toInt().toString();
    }
  }

  _validateConfig() {
    bool rightSymbolHasNumbers = _getOnlyNumbers(rightSymbol).isNotEmpty;

    if (rightSymbolHasNumbers) {
      throw ArgumentError("rightSymbol must not have numbers.");
    }
  }

  String _getOnlyNumbers(String text) {
    String cleanedText = text;

    var onlyNumbersRegex = RegExp(r'[^\d]');

    cleanedText = cleanedText.replaceAll(onlyNumbersRegex, '');

    return cleanedText;
  }

  String _applyMask(double value) {
    List<String> textRepresentation = value
        .toStringAsFixed(precision)
        .replaceAll('.', '')
        .split('')
        .reversed
        .toList(growable: true);

    textRepresentation.insert(precision, decimalSeparator);

    for (var i = precision + 4; true; i = i + 4) {
      if (textRepresentation.length > i) {
        textRepresentation.insert(i, thousandSeparator);
      } else {
        break;
      }
    }

    return textRepresentation.reversed.join('');
  }
}
