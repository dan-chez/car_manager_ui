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

import 'package:flutter/material.dart';
import 'package:carmanager_ui/src/constants/app_colors_constants.dart';

//Custom Icons
const String _iconsFontFamily = "CMIcons";

const IconData _iconDataDelete = IconData(0xe801, fontFamily: _iconsFontFamily);

//Icons
const kAddExpenseIconWhite = Icon(Icons.add, color: kWhite);

const kAddExpenseIconRed = Icon(Icons.add, color: kAmaranthPrimary);

const kCloseIcon = Icon(Icons.close, color: kCanyonBronze);

const kArrowDownIcon = Icon(Icons.arrow_drop_down, color: kMyrtleGreen);

const kArrowForwardIcon = Icon(Icons.arrow_forward_ios_outlined, color: kMyrtleGreen, size: 15);

const kArrowForwardDisableIcon = Icon(Icons.arrow_forward_ios_outlined, color: kSilver, size: 15);

const kBackArrowIcon = Icon(Icons.arrow_back_ios_outlined, color: kMyrtleGreen, size: 20);

const kEditReportIcon = Icon(Icons.edit_note, color: kMyrtleGreen, size: 30);

const kDeleteIcon = Icon(_iconDataDelete, color: kAmaranthPrimary, size: 17);
