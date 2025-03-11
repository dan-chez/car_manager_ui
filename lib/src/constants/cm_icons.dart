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
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

//Custom Icons
const String _iconsFontFamily = "CMIcons";
const String _fontPackage = 'carmanager_ui';

const IconData _iconDataDelete =
    IconData(0xe801, fontFamily: _iconsFontFamily, fontPackage: _fontPackage);

//Icons
const kAddExpenseIconWhite = Icon(Icons.add, color: kWhite);

const kAddExpenseIconRed = Icon(Icons.add, color: kAmaranthPrimary);

const kCloseIcon = Icon(Icons.close, color: kCanyonBronze);

const kArrowDownIcon = Icon(Icons.arrow_drop_down, color: kMyrtleGreen);

const kCheckIcon = Icon(Icons.check, color: kWhite, size: 24);

const kArrowForwardIcon =
    Icon(Icons.arrow_forward_ios_outlined, color: kMyrtleGreen, size: 15);

const kArrowForwardDisableIcon =
    Icon(Icons.arrow_forward_ios_outlined, color: kSilver, size: 15);

const kBackArrowIcon =
    Icon(Icons.arrow_back_ios_outlined, color: kMyrtleGreen, size: 20);

const kEditReportIcon = Icon(Icons.edit_note, color: kMyrtleGreen, size: 30);

const kDeleteIcon = Icon(_iconDataDelete, color: kAmaranthPrimary, size: 17);

const kEditSquareIcon = Icon(Symbols.edit_square, color: kMyrtleGreen, size: 23);

const kMonitoringIcon = Icon(Icons.monitor, color: kMyrtleGreen, size: 45);

const kSecurityIcon =
    Icon(Icons.verified_user_outlined, color: kMyrtleGreen, size: 45);

const kStarIcon = Icon(Icons.star, color: kMyrtleGreen, size: 45);

const kDropdownIcon = Icon(Icons.keyboard_arrow_down_outlined, color: kMyrtleGreen);
