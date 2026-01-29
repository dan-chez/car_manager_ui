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
  group('ErrorDialogData', () {
    test('Constructor creates instance with correct properties', () {
      const data = ErrorDialogData(
        title: 'Error Title',
        titleBoldPositions: [0, 5],
        subtitle: 'Error Subtitle',
        imagePath: 'assets/error.svg',
      );

      expect(data.title, 'Error Title');
      expect(data.titleBoldPositions, [0, 5]);
      expect(data.subtitle, 'Error Subtitle');
      expect(data.imagePath, 'assets/error.svg');
    });

    test('Constructor accepts empty titleBoldPositions', () {
      const data = ErrorDialogData(
        title: 'Title',
        titleBoldPositions: [],
        subtitle: 'Subtitle',
        imagePath: '',
      );

      expect(data.titleBoldPositions, isEmpty);
    });

    test('Constructor accepts empty imagePath', () {
      const data = ErrorDialogData(
        title: 'Title',
        titleBoldPositions: [],
        subtitle: 'Subtitle',
        imagePath: '',
      );

      expect(data.imagePath, '');
    });
  });
}
