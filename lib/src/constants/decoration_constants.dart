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

import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:carmanager_ui/src/constants/cm_dimens.dart';
import 'package:carmanager_ui/src/constants/text_style_constants.dart';
import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(
  border: OutlineInputBorder(borderRadius: _borderRadius),
  focusedBorder: OutlineInputBorder(
    borderSide: _borderSide,
    borderRadius: _borderRadius,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: _borderSide,
    borderRadius: _borderRadius,
  ),
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  errorStyle: kErrorTextStyle,
  hintStyle: TextStyle(color: kMyrtleGreen, fontWeight: FontWeight.w300),
  labelStyle: kContentTextStyle,
  contentPadding: EdgeInsets.symmetric(
    horizontal: CMDimens.d24,
    vertical: CMDimens.d10,
  ),
);

const _borderRadius = BorderRadius.all(Radius.circular(CMDimens.d86));
const _borderSide = BorderSide(color: kSilver);
const _borderSideMultiline = BorderSide(
  color: kMyrtleGreen,
  width: CMDimens.d1,
);
const _multilineBorderRadius = BorderRadius.all(Radius.circular(CMDimens.d5));

const kMultilineTextFieldInputDecoration = InputDecoration(
  border: OutlineInputBorder(borderRadius: _multilineBorderRadius),
  focusedBorder: OutlineInputBorder(
    borderSide: _borderSideMultiline,
    borderRadius: _multilineBorderRadius,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: _borderSideMultiline,
    borderRadius: _multilineBorderRadius,
  ),
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  errorStyle: kErrorTextStyle,
  hintStyle: TextStyle(color: kMyrtleGreen, fontWeight: FontWeight.w300),
  labelStyle: kContentTextStyle,
  contentPadding: EdgeInsets.symmetric(
    horizontal: CMDimens.d20,
    vertical: CMDimens.d10,
  ),
);
