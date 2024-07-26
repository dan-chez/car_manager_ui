import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:carmanager_ui/src/components/text_field/text_field_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CMTextField extends TextFieldBase {
  const CMTextField({
    super.key,
    required String super.hintText,
    required super.onTextChange,
    super.canBeEmpty = false,
    super.isEnabled,
    super.errorText,
    super.maxLength,
    super.style,
    super.textInputType,
    super.textCapitalization,
    String super.initialValue = '',
  });

  @override
  State<StatefulWidget> createState() => _TextCMTextField();
}

class _TextCMTextField extends State<CMTextField> {
  bool _hasError = false;
  late String _errorText;
  late TextStyle _textStyle;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = widget.initialValue ?? '';
    if (widget.canBeEmpty == false) {
      _controller.addListener(() {
        setState(() {
          _hasError = _controller.text.isEmpty;
        });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter>? inputFormatters;
    if (widget.textInputType != null && widget.textInputType == TextInputType.number) {
      inputFormatters = <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];
    }

    _errorText = widget.errorText ?? '';
    var theme = Theme.of(context);
    _textStyle = widget.style ?? kContentTextStyle;
    return TextField(
      textCapitalization: widget.textCapitalization,
      enabled: widget.isEnabled,
      keyboardType: widget.textInputType ?? TextInputType.text,
      onChanged: (value) {
        widget.onTextChange.call(value);
      },
      controller: _controller,
      maxLength: widget.maxLength,
      cursorColor: theme.colorScheme.onSurface,
      decoration: kTextFieldInputDecoration.copyWith(
        labelText: widget.hintText,
        errorText: _hasError ? _errorText : null,
        labelStyle: _hasError ? kErrorTextStyle : kContentTextStyle,
      ),
      inputFormatters: inputFormatters,
      style: _textStyle,
    );
  }
}
