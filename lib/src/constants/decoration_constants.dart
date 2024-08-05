import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/text_constants.dart';
import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(
  border: OutlineInputBorder(borderRadius: _borderRadius),
  focusedBorder:
  OutlineInputBorder(borderSide: _borderSide, borderRadius: _borderRadius),
  enabledBorder:
  OutlineInputBorder(borderSide: _borderSide, borderRadius: _borderRadius),
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  errorStyle: kErrorTextStyle,
  hintStyle: TextStyle(color: kMyrtleGreen, fontWeight: FontWeight.w300),
  labelStyle: kContentTextStyle,
  contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
);

const _borderRadius = BorderRadius.all(Radius.circular(86));
const _borderSide = BorderSide(color: kSilver);
const _borderSideMultiline = BorderSide(color: kMyrtleGreen, width: 1);
const _multilineBorderRadius = BorderRadius.all(Radius.circular(5));

const kMultilineTextFieldInputDecoration = InputDecoration(
  border: OutlineInputBorder(borderRadius: _multilineBorderRadius),
  focusedBorder: OutlineInputBorder(
      borderSide: _borderSideMultiline, borderRadius: _multilineBorderRadius),
  enabledBorder: OutlineInputBorder(
      borderSide: _borderSideMultiline, borderRadius: _multilineBorderRadius),
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  errorStyle: kErrorTextStyle,
  hintStyle: TextStyle(color: kMyrtleGreen, fontWeight: FontWeight.w300),
  labelStyle: kContentTextStyle,
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
);
