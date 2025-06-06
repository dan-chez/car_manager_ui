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

import 'package:car_manager_ui/component_model.dart';
import 'package:car_manager_ui/showcases/animations_showcase.dart';
import 'package:car_manager_ui/showcases/brief_card_showcase.dart';
import 'package:car_manager_ui/showcases/button_showcase.dart';
import 'package:car_manager_ui/showcases/cm_appbar/cm_appbar_showcase.dart';
import 'package:car_manager_ui/showcases/cm_info_panel_showcase.dart';
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

/// A collection of component showcases used in the example application.
///
/// This list holds instances of [ComponentModel], each representing a component
/// showcase with its respective description and navigation path. The [components]
/// list is intended to centralize all the showcases of components used in the app,
/// providing a single source of truth for their descriptions and paths.
final components = {
  ComponentModel(
    description: 'Buttons',
    path: ButtonShowcase.path,
  ),
  ComponentModel(
    description: 'TextFields',
    path: TextFieldShowcase.path,
  ),
  ComponentModel(
    description: 'Icon button',
    path: IconButtonShowcase.path,
  ),
  ComponentModel(
    description: 'RichText',
    path: RichTextShowcase.path,
  ),
  ComponentModel(
    description: 'Dialogs',
    path: DialogsShowcase.path,
  ),
  ComponentModel(
    description: 'PageTitle',
    path: PageTitleShowcase.path,
  ),
  ComponentModel(
    description: 'CMDropdown',
    path: DropdownShowcase.path,
  ),
  ComponentModel(
    description: 'CMEmptyList',
    path: EmptyListShowcase.path,
  ),
  ComponentModel(
    description: 'CMBriefCard',
    path: BriefCardShowcase.path,
  ),
  ComponentModel(
    description: 'CMAppBar',
    path: CMAppbarShowcase.path,
  ),
  ComponentModel(
    description: 'ReportTile',
    path: ReportTileShowcase.path,
  ),
  ComponentModel(
    description: 'SummaryCard',
    path: SummaryCardShowcase.path,
  ),
  ComponentModel(
    description: 'CMInfoCard',
    path: InfoCardShowcase.path,
  ),
  ComponentModel(
    description: 'HorizontalInfoCard',
    path: HorizontalInfoCardShowcase.path,
  ),
  ComponentModel(
    description: 'VerticalInfoCard',
    path: VerticalInfoCardShowcase.path,
  ),
  ComponentModel(
    description: 'ExpenseSummaryCard',
    path: ExpenseSummaryCardShowcase.path,
  ),
  ComponentModel(
    description: 'CMToggleButton',
    path: ToggleButtonShowcase.path,
  ),
  ComponentModel(
    description: 'CMDateButton',
    path: DateButtonShowcase.path,
  ),
  ComponentModel(
    description: 'SelectableVehicleType',
    path: SelectableVehicleTypeShowcase.path,
  ),
  ComponentModel(
    description: 'SelectableServiceType',
    path: SelectableServiceTypeShowcase.path,
  ),
  ComponentModel(
    description: 'VehicleInfoCard',
    path: VehicleInfoCardShowcase.path,
  ),
  ComponentModel(
    description: 'CurrentVehicleCard',
    path: CurrentVehicleCardShowcase.path,
  ),
  ComponentModel(
    description: 'ExpensesLineChart',
    path: ExpensesLineChartShowcase.path,
  ),
  ComponentModel(
    description: 'WarningInfo',
    path: WarningInfoShowcase.path,
  ),
  ComponentModel(
    description: 'Animations',
    path: AnimationsShowcase.path,
  ),
  ComponentModel(
    description: 'ProfileMenuItem',
    path: ProfileMenuItemShowcase.path,
  ),
  ComponentModel(
    description: 'CMInfoPanel',
    path: CMInfoPanelShowcase.path,
  ),
};
