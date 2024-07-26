import 'package:carmanager_ui/carmanager_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextFieldShowcase extends StatelessWidget {
  static String path = '/textField';

  const TextFieldShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('TextField showcase'),
      ),
      body: ScrollConfiguration(
        behavior: CMScrollBehavior(),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          children: [
            Text(
              'CMTextField',
              style: kMediumTitleTextStyle.copyWith(fontSize: 18),
            ),
            _createTextFieldTitle('Can\'t be empty, capitalize first letter of each word, support any input'),
            const CMTextField(
              hintText: 'Get value',
              onTextChange: _printValue,
              errorText: 'This can\'t be empty',
              textCapitalization: TextCapitalization.words,
            ),
            _createTextFieldTitle(
                'Can\'t be empty, capitalize first letter of each word, support any input, initial value'),
            const CMTextField(
              hintText: 'Custom hint',
              onTextChange: _printValue,
              errorText: 'This can\'t be empty',
              textCapitalization: TextCapitalization.words,
              initialValue: 'Custom initial value',
            ),
            _createTextFieldTitle('Can be empty, support any input, initial value'),
            const CMTextField(
              hintText: 'Custom hint',
              onTextChange: _printValue,
              canBeEmpty: true,
              errorText: 'This can\'t be empty',
              initialValue: 'Custom initial value',
            ),
            _createTextFieldTitle('Can be empty, numbers input'),
            const CMTextField(
              hintText: 'Custom hint',
              onTextChange: _printValue,
              canBeEmpty: true,
              textInputType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}

void _printValue(String value) {
  if (kDebugMode) {
    print(value);
  }
}

Widget _createTextFieldTitle(String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 16),
      Text(
        title,
        style: kMediumTitleTextStyle.copyWith(fontSize: 12),
      ),
      const SizedBox(height: 16),
    ],
  );
}
