import 'package:carmanager_ui/src/constants/string_constants.dart';
import 'package:flutter/material.dart' show VoidCallback;

class ConfirmDialogData {
  final String message;
  final String buttonText;
  final String? image;
  final VoidCallback? onPressed;
  final List<int> boldPositions;
  final String textDivider;
  final bool canPop;
  final bool showCloseButton;
  final bool popWhenOnPressed;

  const ConfirmDialogData({
    required this.message,
    required this.buttonText,
    this.image,
    this.onPressed,
    this.boldPositions = const [],
    this.textDivider = StringConstants.textDivider,
    this.canPop = true,
    this.showCloseButton = true,
    this.popWhenOnPressed = true,
  });
}
