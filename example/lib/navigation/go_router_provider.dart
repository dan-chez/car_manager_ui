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

import 'package:car_manager_ui/main.dart';
import 'package:car_manager_ui/showcases/animations_showcase.dart';
import 'package:car_manager_ui/showcases/brief_card_showcase.dart';
import 'package:car_manager_ui/showcases/button_showcase.dart';
import 'package:car_manager_ui/showcases/cm_appbar/cm_appbar_back_showcase.dart';
import 'package:car_manager_ui/showcases/cm_appbar/cm_appbar_no_back_showcase.dart';
import 'package:car_manager_ui/showcases/cm_appbar/cm_appbar_showcase.dart';
import 'package:car_manager_ui/showcases/current_vehicle_card_showcase.dart';
import 'package:car_manager_ui/showcases/date_button_showcase.dart';
import 'package:car_manager_ui/showcases/dialogs_showcase.dart';
import 'package:car_manager_ui/showcases/dropdown_showcase.dart';
import 'package:car_manager_ui/showcases/empty_list_showcase.dart';
import 'package:car_manager_ui/showcases/expense_summary_card_showcase.dart';
import 'package:car_manager_ui/showcases/expenses_line_chart_showcase.dart';
import 'package:car_manager_ui/showcases/horizontal_info_card_showcase.dart';
import 'package:car_manager_ui/showcases/icon_button_showcase.dart';
import 'package:car_manager_ui/showcases/info_card_showcase.dart';
import 'package:car_manager_ui/showcases/page_title_showcase.dart';
import 'package:car_manager_ui/showcases/profile_menu_item_showcase.dart';
import 'package:car_manager_ui/showcases/report_tile_showcase.dart';
import 'package:car_manager_ui/showcases/rich_text_showcase.dart';
import 'package:car_manager_ui/showcases/selectable_service_type_showcase.dart';
import 'package:car_manager_ui/showcases/selectable_vehicle_type_showcase.dart';
import 'package:car_manager_ui/showcases/summary_card_showcase.dart';
import 'package:car_manager_ui/showcases/text_field_showcase.dart';
import 'package:car_manager_ui/showcases/toggle_button_showcase.dart';
import 'package:car_manager_ui/showcases/vehicle_info_card_showcase.dart';
import 'package:car_manager_ui/showcases/vertical_info_card_showcase.dart';
import 'package:car_manager_ui/showcases/warning_info_showcase.dart';
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _appNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'appNavigatorKey');

/// A Riverpod provider for GoRouter, providing an instance of GoRouter
/// configured through the GoRouterHelper class.
final goRouterProvider = Provider<GoRouter>((_) => GoRouterHelper().router);

/// A helper class to configure and manage GoRouter instance.
/// This class follows the Singleton pattern to ensure only one instance
/// of the router is created.
class GoRouterHelper {
  static final GoRouterHelper _instance = GoRouterHelper._internal();

  factory GoRouterHelper() => _instance;

  late final GoRouter router;

  GoRouterHelper._internal() {
    // All component screens must be added here
    var routes = [
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: MyHomePage.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const MyHomePage(title: 'Sample widget app'),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: ButtonShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const ButtonShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: DateButtonShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const DateButtonShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: TextFieldShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const TextFieldShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: IconButtonShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const IconButtonShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: RichTextShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const RichTextShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: PageTitleShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const PageTitleShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: DialogsShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const DialogsShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: DropdownShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const DropdownShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: CMAppbarShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const CMAppbarShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: CMAppbarBackShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const CMAppbarBackShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: CMAppbarNoBackShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const CMAppbarNoBackShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: EmptyListShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const EmptyListShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: BriefCardShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const BriefCardShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: ReportTileShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const ReportTileShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: InfoCardShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const InfoCardShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: SummaryCardShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const SummaryCardShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: HorizontalInfoCardShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const HorizontalInfoCardShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: VerticalInfoCardShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const VerticalInfoCardShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: ExpenseSummaryCardShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const ExpenseSummaryCardShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: ToggleButtonShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const ToggleButtonShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: SelectableVehicleTypeShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const SelectableVehicleTypeShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: SelectableServiceTypeShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const SelectableServiceTypeShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: VehicleInfoCardShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const VehicleInfoCardShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: CurrentVehicleCardShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const CurrentVehicleCardShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: ExpensesLineChartShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const ExpensesLineChartShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: WarningInfoShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const WarningInfoShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: AnimationsShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const AnimationsShowcase(),
            state: state,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: ProfileMenuItemShowcase.path,
        pageBuilder: (_, state) {
          return _getPage(
            child: const ProfileMenuItemShowcase(),
            state: state,
          );
        },
      ),

      // Dialog routes
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: ConfirmDialogRoute.path,
        pageBuilder: (context, state) => ConfirmDialogRoute.createRoute(
            context, state,
            dialogData: state.extra as ConfirmDialogData),
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: ErrorDialogRoute.path,
        pageBuilder: (context, state) => ErrorDialogRoute.createRoute(
            context, state,
            dialogData: state.extra as ErrorDialogData),
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: LoadingDialogRoute.path,
        pageBuilder: (context, state) => LoadingDialogRoute.createRoute(
            context, state,
            dialogData: state.extra as LoadingDialogData),
      ),
      GoRoute(
        parentNavigatorKey: _appNavigatorKey,
        path: CarPickerDialogRoute.path,
        pageBuilder: (context, state) => CarPickerDialogRoute.createRoute(
            context, state,
            dialogData: state.extra as CarPickerDialogData),
      ),
    ];
    router = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: _appNavigatorKey,
      initialLocation: MyHomePage.path,
      routes: routes,
    );
  }

  Page _getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
