import 'dart:io';

import 'package:args/args.dart';
import 'package:breizh_blok_mobile/config/flavors.dart';

void main(List<String> args) {
  final parser = ArgParser()
    ..addOption(
      'flavor',
      mandatory: true,
      allowed: Flavors.values.map((f) => f.name),
    )
  ;
  final argsResult = parser.parse(args);
  final flavor = argsResult.option('flavor');

  if (flavor == null) {
    throw Exception('flavor option is required');
  }

  final isProd = flavor == Flavors.prod.name;

  final project = isProd ? 'boulders-topo' : 'boulders-topo-test';
  
  stdout.write('''
--yes
--platforms=android,ios
--project=$project
--out=lib/firebase_options_$flavor.dart
--ios-bundle-id=fr.geekco.boulders${isProd ? '' : '.staging'}
--ios-out=ios/flavors/$flavor/GoogleService-Info.plist
--ios-build-config=Debug-$flavor
--android-package-name=fr.geekco.boulders${isProd ? '' : '.staging'}
--android-out=android/app/src/$flavor/google-services.json
--overwrite-firebase-options  
''');
}
