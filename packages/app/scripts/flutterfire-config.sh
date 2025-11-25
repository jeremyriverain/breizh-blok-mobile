#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors

fvm dart pub global activate flutterfire_cli

fvm dart pub global run flutterfire_cli:flutterfire configure \
      --yes \
      --platforms=android,ios \
      --project={todo: replace with --staging-project arg} \
      --out=lib/firebase_options_staging.dart \
      --ios-bundle-id=fr.geekco.boulders.staging \
      --ios-out=ios/flavors/staging/GoogleService-Info.plist \
      --ios-build-config=Debug-staging \
      --android-package-name=fr.geekco.boulders.staging \
      --android-out=android/app/src/staging/google-services.json \
      --overwrite-firebase-options

fvm dart pub global run flutterfire_cli:flutterfire configure \
      --yes \
      --platforms=android,ios \
      --project={todo: replace with --prod-project arg} \
      --out=lib/firebase_options_prod.dart \
      --ios-bundle-id=fr.geekco.boulders \
      --ios-out=ios/flavors/prod/GoogleService-Info.plist \
      --ios-build-config=Debug-prod \
      --android-package-name=fr.geekco.boulders \
      --android-out=android/app/src/prod/google-services.json \
      --overwrite-firebase-options
