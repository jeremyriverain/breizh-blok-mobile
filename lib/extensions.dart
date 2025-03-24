import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension BuildContextExtension on BuildContext {
  Future<Uint8List> getResponsiveImageData({required String imagePath}) async {
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(this);
    try {
      final bytes = await rootBundle.load(
        devicePixelRatio != 1
            ? imagePath.replaceFirst(
              '/images/',
              '/images/${devicePixelRatio.toInt()}.0x/',
            )
            : imagePath,
      );
      return bytes.buffer.asUint8List();
    } catch (e) {
      final bytes = await rootBundle.load(imagePath);
      return bytes.buffer.asUint8List();
    }
  }
}
