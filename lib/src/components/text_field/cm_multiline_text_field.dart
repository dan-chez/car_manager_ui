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

import 'package:carmanager_ui/src/components/text_field/text_field_base.dart';
import 'package:carmanager_ui/src/constants/decoration_constants.dart';
import 'package:carmanager_ui/src/constants/text_constants.dart';
import 'package:flutter/material.dart';

class CMMultilineTextField extends TextFieldBase {
  const CMMultilineTextField({
    super.key,
    String super.hintText = '',
    required super.onTextChange,
    super.canBeEmpty = true,
    super.isEnabled,
    super.errorText,
    super.maxLength,
    super.style,
    super.initialValue,
  });

  @override
  State<StatefulWidget> createState() => _MultilineCMTextField();
}

class _MultilineCMTextField extends State<TextFieldBase> {
  bool _hasError = false;
  late String _errorText;
  late TextStyle _textStyle;
  late TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller?.text = widget.initialValue ?? '';
    if (widget.canBeEmpty == false) {
      _controller?.addListener(() {
        setState(() {
          _hasError = _controller!.text.isEmpty;
        });
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _errorText = widget.errorText ?? '';
    var theme = Theme.of(context);
    _textStyle = widget.style ?? kContentTextStyle;
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      enabled: widget.isEnabled,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        widget.onTextChange.call(value);
      },
      controller: _controller,
      maxLines: 2,
      minLines: 2,
      maxLength: widget.maxLength,
      cursorColor: theme.colorScheme.onSurface,
      decoration: kMultilineTextFieldInputDecoration.copyWith(
        hintText: widget.hintText,
        errorText: _hasError ? _errorText : null,
        labelStyle: _hasError ? kErrorTextStyle : kContentTextStyle,
      ),
      style: _textStyle,
    );
  }
}
