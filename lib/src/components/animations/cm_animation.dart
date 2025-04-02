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
import 'package:lottie/lottie.dart';

/// A wrapper for Lottie animations that simplifies usage.
///
/// This widget displays a Lottie animation from an asset file with optional
/// customization options such as looping, reversing, size, and fitting.
///
/// Example usage:
/// ```dart
/// CMAnimation('assets/animation')
/// ```
class CMAnimation extends StatelessWidget {
  final String assetPath;
  final bool? repeat;
  final bool? reverse;
  final bool? animate;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final void Function(LottieComposition)? onLoaded;

  const CMAnimation(
    this.assetPath, {
    super.key,
    this.repeat,
    this.reverse,
    this.animate,
    this.width,
    this.height,
    this.fit,
    this.onLoaded,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      assetPath,
      repeat: repeat,
      reverse: reverse,
      animate: animate,
      width: width,
      height: height,
      fit: fit,
      onLoaded: onLoaded,
    );
  }
}
