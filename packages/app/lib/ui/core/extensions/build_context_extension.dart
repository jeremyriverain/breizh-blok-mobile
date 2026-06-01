import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension BuildContextExtension on BuildContext {
  Future<Uint8List> getResponsiveImageData({required String imagePath}) async {
    final assetImage = AssetImage(imagePath);

    final stream = assetImage.resolve(
      createLocalImageConfiguration(this),
    );

    final completer = Completer<Uint8List>();

    stream.addListener(
      ImageStreamListener((imageInfo, synchronousCall) async {
        final byteData = await imageInfo.image.toByteData(
          format: ui.ImageByteFormat.png,
        );
        if (byteData != null) {
          completer.complete(byteData.buffer.asUint8List());
        } else {
          completer.completeError('Could not convert image to bytes');
        }
      }),
    );

    return completer.future;
  }
}
