import 'dart:math';
import 'dart:ui';

extension ColorExtension on Color {
  static Color random() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }
}
