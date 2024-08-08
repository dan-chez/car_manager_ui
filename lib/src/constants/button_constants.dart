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
