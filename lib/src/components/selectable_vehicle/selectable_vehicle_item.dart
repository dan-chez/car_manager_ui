class SelectableVehicleItem {
  /// Unique identifier for the vehicle option.
  final String id;

  /// Path or asset name of the vehicle icon.
  final String icon;

  /// Descriptive label for the vehicle option.
  final String description;

  const SelectableVehicleItem({
    required this.id,
    required this.icon,
    required this.description,
  });
}
