#!/bin/bash
# Script to generate Firebase configuration files for different environments/flavors

set -e

# Parse arguments
for i in "$@"
do
case $i in
    --staging-project=*)
    STAGING_PROJECT="${i#*=}"
    shift # past argument=value
    ;;
    --prod-project=*)
    PROD_PROJECT="${i#*=}"
    shift # past argument=value
    ;;
    *)
          # unknown option
    ;;
esac
done

if [ -z "$STAGING_PROJECT" ] || [ -z "$PROD_PROJECT" ]
then
      echo "Usage: ./scripts/flutterfire-config.sh --staging-project=<staging_project_id> --prod-project=<prod_project_id>"
      exit 1
fi

fvm dart pub global activate flutterfire_cli

fvm dart pub global run flutterfire_cli:flutterfire configure \
      --yes \
      --platforms=android,ios \
      --project=$STAGING_PROJECT \
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
      --project=$PROD_PROJECT \
      --out=lib/firebase_options_prod.dart \
      --ios-bundle-id=fr.geekco.boulders \
      --ios-out=ios/flavors/prod/GoogleService-Info.plist \
      --ios-build-config=Debug-prod \
      --android-package-name=fr.geekco.boulders \
      --android-out=android/app/src/prod/google-services.json \
      --overwrite-firebase-options
