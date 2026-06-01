import 'package:flutter/material.dart';

final List<Color> palette = [
  Colors.red.shade400,
  Colors.blue.shade400,
  Colors.green.shade400,
  Colors.orange.shade400,
  Colors.purple.shade400,
  Colors.pink.shade400,
  Colors.teal.shade400,
  Colors.indigo.shade400,
  Colors.cyan.shade400,
];

extension StringExtension on String {
  int _hashDjb2() {
    var hash = 5381;
    for (var i = 0; i < length; i++) {
      hash = ((hash << 5) + hash) + codeUnitAt(i);
    }
    return hash;
  }

  Color randomColorFromString() {
    final index = _hashDjb2().abs() % palette.length;
    debugPrint(index.toString());
    return palette[index];
  }
}
