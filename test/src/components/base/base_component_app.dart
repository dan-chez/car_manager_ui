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

/// Wraps a given widget in a [MaterialApp] with a [Scaffold] as the home.
/// This allows the encapsulation of a widget in a basic app structure to provide necessary
/// context and avoid boilerplate code.
///
/// Example:
/// ```dart
/// testWidgets('Test description', (WidgetTester tester) async {
///   await tester.pumpWidget(
///     baseComponentApp(MyWidget()),
///   );
///   // Additional test code here
/// });
/// ```
///
/// - [widget]: The widget to be wrapped in the app structure.
///
/// Returns a [MaterialApp] with the provided widget as its body.
Widget baseComponentApp(Widget widget) {
  return MaterialApp(
    home: Scaffold(
      body: widget,
    ),
  );
}
