import 'package:flutter/material.dart';

/// Abstract base class for dialog widgets, extending StatelessWidget.
/// This class is generic, allowing different types of data to be passed
/// to dialogs inheriting from this base class.
///
/// [DialogBase] requires a [data] parameter of type [T],
/// which is used to initialize the dialog's data.
abstract class DialogBase<T> extends StatelessWidget {
  final T data;

  const DialogBase({
    super.key,
    required this.data,
  });
}
