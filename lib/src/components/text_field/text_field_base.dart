import 'package:flutter/material.dart';

abstract class TextFieldBase extends StatefulWidget {
  final bool? canBeEmpty;
  final String? errorText;
  final bool isEnabled;
  final int? maxLength;
  final TextStyle? style;
  final String? hintText;
  final void Function(String) onTextChange;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextCapitalization textCapitalization;
  final String? initialValue;

  const TextFieldBase({
    super.key,
    this.canBeEmpty,
    this.errorText,
    this.isEnabled = true,
    this.maxLength,
    this.style,
    required this.hintText,
    required this.onTextChange,
    this.focusNode,
    this.textInputType,
    this.textCapitalization = TextCapitalization.none,
    this.initialValue,
  });
}
