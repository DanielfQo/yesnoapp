import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(0, 22, 22, 174);

const List<Color> _colorThemes = [
  _customColor,
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert(selectedColor >= 0 && selectedColor < _colorThemes.length, 'Colors must be between 0 and ${_colorThemes.length - 1}');


  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.light
    );
  }
}