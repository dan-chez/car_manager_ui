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

import 'package:carmanager_ui/src/constants/string_constants.dart';
import 'package:flutter/material.dart' show VoidCallback;

class ConfirmDialogData {
  final String? title;
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
    this.title,
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
