# Car Manager UI

[![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

**Car Manager UI** is a library of graphical components designed for the Car Manager application. This library provides a collection of widgets and UI elements that make it easy to create vehicle management applications with Flutter.

## Features

- **Customizable Components**: Includes a variety of customizable widgets to create attractive and functional interfaces.
- **Easy Integration**: Simple integration into your codebase.
- **Stylish Components**: All components are designed to be visually appealing and aesthetically pleasing.
- 
## Available Widgets

**Car Manager UI** provides a comprehensive set of widgets to help you build a feature-rich and visually appealing vehicle management application. Below is a list of the available widgets:

- **CloseIconButton**: A customizable icon button designed for closing dialogs.
- **CMIconButton**: A versatile icon button that can be used for various actions within the app.
- **PrimaryButton**: A primary action button with customizable styles, text, and loading state.
- **ConfirmDialog**: A dialog widget for confirming user actions with customizable messages and buttons.
- **ErrorDialog**: A dialog widget for displaying error messages with customizable content.
- **LoadingDialog**: A dialog widget that shows a loading indicator, useful for asynchronous operations.
- **CMDropdown**: A dropdown menu widget for selecting options from a list.
- **Loader**: A simple loading indicator widget.
- **CMMoneyTextField**: A text field widget specifically designed for inputting monetary values.
- **CMMultilineTextField**: A text field widget that supports multiline input, ideal for longer text entries.
- **CMTextField**: A standard text field widget with customizable styles.
- **CMPageTitle**: A widget for displaying page titles with consistent styling.
- **CMRichText**: A widget for displaying rich text with various styles and formatting options.

These widgets are designed to be easily integrated into your codebase, providing a consistent and professional look and feel across your application.

## Usage

To use the components from the Car Manager UI library, first import the library into your Dart file. Below is an example of how to use the `PrimaryButton` component in your Flutter application.

```dart
import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Car Manager UI Example'),
        ),
        body: Center(
          child: PrimaryButton(
            txtLabel: 'Click Me',
            onPressed: () {
              // Your onPressed function here
            },
            isLoading: false,
            icon: const Icon(Icons.car_rental),
          ),
        ),
      ),
    );
  }
}
```

## Contributions

Contributions are welcome! If you want to contribute to this project, follow these steps:

1. Fork this repository.
2. Create a new branch for your feature or bug fix (`git checkout -b feature/new-feature`).
3. Make your changes and commit them (`git commit -m 'Add new feature'`).
4. Push your changes to your fork (`git push origin feature/new-feature`).
5. Open a pull request in this repository.

## License

This project is licensed under the Apache License 2.0. See the LICENSE file for more details.
