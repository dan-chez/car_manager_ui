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

extension NumberExtension on int {
  /// Determines whether the integer represents a profit.
  ///
  /// A profit is defined as any number greater than or equal to zero.
  /// - Returns `true` if the number is 0 or greater (profit).
  /// - Returns `false` if the number is negative (loss).
  ///
  /// Example:
  /// ```dart
  /// 100.isProfit;  // Returns: true
  /// -50.isProfit;  // Returns: false
  /// 0.isProfit;    // Returns: true
  /// ```
  bool get isProfit => this >= 0 ? true : false;
}
