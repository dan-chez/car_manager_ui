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

import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:carmanager_ui/src/components/text_field/money_text_field/money_text_editing_controller.dart';
import 'package:carmanager_ui/src/components/text_field/text_field_base.dart';
import 'package:carmanager_ui/src/constants/decoration_constants.dart';
import 'package:flutter/material.dart';

class CMMoneyTextField extends TextFieldBase {
  const CMMoneyTextField({
    super.key,
    required String super.hintText,
    required super.onTextChange,
    super.canBeEmpty = false,
    super.isEnabled,
    super.errorText,
    super.maxLength,
    super.style,
    super.initialValue,
  });

  @override
  State<StatefulWidget> createState() => _MoneyCMTextFieldState();
}

class _MoneyCMTextFieldState extends State<TextFieldBase> {
  bool _hasError = false;
  late CMMoneyTextController _controller;
  late String _errorText;
  late TextStyle _textStyle;

  @override
  void initState() {
    super.initState();
    _controller = CMMoneyTextController();
    _controller.text = widget.initialValue ?? '';
    _controller.addListener(() {
      setState(() {
        if (widget.canBeEmpty == false) {
          _hasError = _controller.hasError;
        }
        widget.onTextChange.call(_controller.finalValue);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _errorText = widget.errorText ?? '';
    var theme = Theme.of(context);
    _textStyle = widget.style ?? kContentTextStyle;

    return TextField(
      enabled: widget.isEnabled,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
        signed: true,
      ),
      controller: _controller,
      maxLength: widget.maxLength,
      cursorColor: theme.colorScheme.onSurface,
      decoration: kTextFieldInputDecoration.copyWith(
        labelText: widget.hintText,
        errorText: _hasError ? _errorText : null,
        labelStyle: _hasError
            ? kErrorTextStyle
            : (widget.isEnabled
                ? kContentTextStyle
                : kContentTextStyle.copyWith(
                    color: kDarkDisable,
                  )),
      ),
      style: widget.isEnabled
          ? _textStyle
          : _textStyle.copyWith(
              color: kDarkDisable,
            ),
    );
  }
}
