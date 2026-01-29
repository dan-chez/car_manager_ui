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

import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoadingDialogData', () {
    test('Constructor creates instance with default dimensions', () {
      const data = LoadingDialogData(
        lottieAssetPath: 'assets/loading.json',
      );

      expect(data.lottieAssetPath, 'assets/loading.json');
      expect(data.height, double.infinity);
      expect(data.width, double.infinity);
    });

    test('Constructor creates instance with custom dimensions', () {
      const data = LoadingDialogData(
        height: 100.0,
        width: 150.0,
        lottieAssetPath: 'assets/custom.json',
      );

      expect(data.lottieAssetPath, 'assets/custom.json');
      expect(data.height, 100.0);
      expect(data.width, 150.0);
    });

    test('Constructor accepts empty lottieAssetPath', () {
      const data = LoadingDialogData(
        lottieAssetPath: '',
      );

      expect(data.lottieAssetPath, '');
      expect(data.height, double.infinity);
      expect(data.width, double.infinity);
    });
  });
}
