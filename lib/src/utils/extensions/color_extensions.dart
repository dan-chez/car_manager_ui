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

import 'dart:ui';

extension ColorExtension on Color {

  /// Returns a new color with the given [opacity] value (0.0 to 1.0).
  Color withOpacityValue(double opacity) {
    if (opacity > 1.0) {
      throw ArgumentError('Opacity must be between 0.0 and 1.0.');
    }
    int alfa = (opacity * 255).round();
    return withAlpha(alfa);
  }
}
