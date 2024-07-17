/// A model representing a component showcase.
///
/// This model includes:
/// - [description]: A brief description of the component.
/// - [path]: The navigation path used by GoRouter to display the component showcase.
class ComponentModel {
  final String description;
  final String path;

  const ComponentModel({
    required this.description,
    required this.path,
  });
}
