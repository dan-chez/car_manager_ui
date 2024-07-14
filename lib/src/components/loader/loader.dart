import 'package:carmanager_ui/src/constants/app_colors_constants.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.size = const Size(20, 20),
    this.color = kWhite,
    this.strokeWidth = 3,
  });

  final Size size;
  final double strokeWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
