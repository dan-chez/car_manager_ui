import 'package:car_manager_ui/component_model.dart';
import 'package:car_manager_ui/showcases/button_showcase.dart';
import 'package:car_manager_ui/showcases/rich_text_showcase.dart';
import 'package:car_manager_ui/showcases/text_field_showcase.dart';

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
    description: 'RichText',
    path: RichTextShowcase.path,
  ),
};
