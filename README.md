# Car Manager UI

[![Pub Version](https://img.shields.io/pub/v/car_manager_ui.svg)](https://pub.dev/packages/car_manager_ui)
[![License: Apache 2.0](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

**Car Manager UI** is a library of graphical components designed for the Car Manager application. This library provides a collection of widgets and UI elements that make it easy to create vehicle management applications with Flutter.

## Features

- **Customizable Components**: Includes a variety of customizable widgets to create attractive and functional interfaces.
- **Easy Integration**: Simple integration into your codebase.
- **Stylish Components**: All components are designed to be visually appealing and aesthetically pleasing.

## Get Started

Use this package as a library in your Flutter project.

### Depend on it

Run this command:

With Flutter:

```bash
$ flutter pub add car_manager_ui
```

This will add a line like this to your package’s pubspec.yaml (and run an implicit flutter pub get):

```yaml
dependencies:
  car_manager_ui: ^0.0.1
```

Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.

Import it

Now in your Dart code, you can use:

```dart
import 'package:carmanager_ui/carmanager_ui.dart';
```

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
          // Primary button customized with Car Manager UI.
          child: PrimaryButton(
            // Text displayed on the button.
            txtLabel: 'Click Me',
            // Function executed when the button is pressed.
            onPressed: () {
              // Your onPressed function here
            },
            // Indicates whether the button is in a loading state.
            isLoading: false,
            // Icon displayed on the button.
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
