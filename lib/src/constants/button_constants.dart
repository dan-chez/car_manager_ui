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

final kCMButtonStyle = TextButton.styleFrom(
  shape: const StadiumBorder(),
  disabledBackgroundColor: kGreyDisable,
  backgroundColor: kAmaranthPrimary,
  foregroundColor: kMyrtleGreen,
);

final kCMOutlinedButtonStyle = OutlinedButton.styleFrom(
  shape: const StadiumBorder(),
  side: const BorderSide(color: kAmaranthPrimary),
  disabledBackgroundColor: kAmaranthPrimary.withOpacity(0.3),
  backgroundColor: kWhite,
  foregroundColor: kAmaranthPrimary,
);

final kCMBriefCardButtonStyle = ElevatedButton.styleFrom(
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  elevation: 3.5,
  shadowColor: kLightShadowColor,
  backgroundColor: kCornejo,
  disabledBackgroundColor: kDarkDisable,
);

final kReportTileButtonStyle = ElevatedButton.styleFrom(
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
  ),
  elevation: 3.5,
  shadowColor: kLightShadowColor,
  backgroundColor: kCornejo,
  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 15, right: 10),
);
