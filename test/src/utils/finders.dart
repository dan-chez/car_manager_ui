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

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// A utility function to find a [RichText] widget containing the specified [substring].
///
/// This function searches through the widget tree for [RichText] widgets and checks
/// if their plain text content contains the given [substring]. It's particularly
/// useful for testing text rendering in widgets that use [RichText] internally.
Finder findRichTextBySubstring(String substring) {
  return find.byWidgetPredicate((widget) {
    if (widget is RichText) {
      final plain = (widget.text as TextSpan).toPlainText();
      return plain.contains(substring);
    }
    return false;
  });
}
