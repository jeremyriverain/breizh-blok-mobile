import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:flutter_driver/flutter_driver.dart';
import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  final driver = await FlutterDriver.connect();
  await integrationDriver(
    driver: driver,
    onScreenshot: (name, bytes, [args]) async {
      final image = await File('integration_test/screenshots/$name.png')
          .create(recursive: true);
      image.writeAsBytesSync(bytes);
      return true;
    },
  );
}
