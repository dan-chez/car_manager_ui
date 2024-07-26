import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/int_constants.dart';
import 'package:flutter/material.dart';

// Button Style

const kCMButtonTextStyle = TextStyle(
  fontSize: kTextContentSize,
  color: kWhite,
  fontWeight: FontWeight.w600,
);

// End Button Style

// Text Style

const kMediumTitleTextStyle = TextStyle(
  fontSize: kTextMediumTitleSize,
  color: kMyrtleGreen,
);

const kContentTextStyle = TextStyle(
  fontSize: kTextContentSize,
  color: kMyrtleGreen,
  fontWeight: FontWeight.w300,
);

const kErrorTextStyle = TextStyle(
  fontSize: kTextErrorSize,
  color: kAmaranthPrimary,
  fontWeight: FontWeight.w300,
);


// End Text Style

// TextField

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

// TextField end
