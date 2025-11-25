# Breizh Blok

[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=jeremyriverain_breizh-blok-mobile&metric=coverage)](https://sonarcloud.io/summary/new_code?id=jeremyriverain_breizh-blok-mobile) [![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=jeremyriverain_breizh-blok-mobile&metric=code_smells)](https://sonarcloud.io/summary/new_code?id=jeremyriverain_breizh-blok-mobile) [![Duplicated Lines (%)](https://sonarcloud.io/api/project_badges/measure?project=jeremyriverain_breizh-blok-mobile&metric=duplicated_lines_density)](https://sonarcloud.io/summary/new_code?id=jeremyriverain_breizh-blok-mobile)

Breizh Blok is a mobile application listing climbing boulders in Brittany

## Pre-requisites

Install [FVM](https://fvm.app/).

## Installation

Define the following env variables:

- `BREIZH_BLOK_API_HOST`
- `BREIZH_BLOK_MIX_PANEL_TOKEN`
- `BREIZH_BLOK_MAPBOX_TOKEN`
- `BREIZH_BLOK_SENTRY_URL`
- `BREIZH_BLOK_AUTH0_CLIENT_ID`

```bash
fvm dart run melos bs
fvm dart run melos run build_runner
```

Next, generate the Firebase configuration files:

```bash
cd packages/app
./scripts/firebase-configure.sh --staging-project=foo --prod-project=bar
```

Replace `foo` and `bar` with the Firebase project IDs.

## Usage

### Launch the app in debug mode

```bash
fvm dart run melos exec --scope="breizh_blok_mobile" -- fvm flutter run --debug
```

### Run the static analysis

```bash
fvm dart run melos run analyze
```

### Execute the unit and widget tests

```bash
fvm dart run melos run test
```

### Execute integration tests

```bash
cd packages/app
fvm flutter test integration_test/all_test.dart
```

### Generate the launch icons

```bash
fvm dart run melos exec --scope="breizh_blok_mobile" -- fvm dart run flutter_launcher_icons
```
