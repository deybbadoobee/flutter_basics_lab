import 'package:flutter/material.dart';

// ---------------------------------------------------------------
// Change these two lines to your own details before you start.
// ---------------------------------------------------------------
const String studentName = 'ILGX3_GULTIANO_DAVENATHAN';
const String studentId = '241-01332';

// Your personal theme color is picked from the last two digits
// of your student ID.
const List<String> _colorNames = [
  'Red',
  'Pink',
  'Purple',
  'Deep Purple',
  'Indigo',
  'Blue',
  'Light Blue',
  'Cyan',
  'Teal',
  'Green',
  'Light Green',
  'Lime',
  'Yellow',
  'Amber',
  'Orange',
  'Deep Orange',
  'Brown',
  'Blue Grey',
];

int get _colorIndex {
  final String digits = studentId.replaceAll(RegExp(r'[^0-9]'), '');

  if (digits.length < 2) {
    return 0;
  }

  final int lastTwo = int.parse(digits.substring(digits.length - 2));

  return lastTwo % Colors.primaries.length;
}

Color get studentColor => Colors.primaries[_colorIndex];

String get studentColorName => _colorNames[_colorIndex];