# Breizh Blok

[![Codemagic build status](https://api.codemagic.io/apps/650ad9baab73c45ac24d4bca/ci/status_badge.svg)](https://codemagic.io/apps/650ad9baab73c45ac24d4bca/ci/latest_build)

Application mobile (disponible sur iOS et Android) répertoriant les blocs d'escalade en Bretagne

## Configuration

Définissez les variables d'environnement suivantes:

- `BREIZH_BLOK_API_HOST` (hôte de l'API, par exemple `api.example.com`)
- `BREIZH_BLOK_GMAPS_KEY` (clé API pour Google Maps)
- `BREIZH_BLOK_SENTRY_DSN` (facultatif. adresse DSN fournie par Sentry)

## Commandes utiles

### Démarrer l'application en mode DEV

```bash
flutter run --dart-define="API_HOST=$BREIZH_BLOK_API_HOST" --dart-define="GMAPS_KEY=$BREIZH_BLOK_GMAPS_KEY" --dart-define="TOMTOM_APIKEY=$BREIZH_BLOK_TOMTOM_APIKEY" --debug
```

### Analyse statique de code

```bash
flutter analyze
```

### Exécuter les tests unitaires et tests de widgets

```bash
flutter test
```

### Exécuter les tests E2E

```bash
flutter test integration_test --dart-define="API_HOST=$BREIZH_BLOK_API_HOST" --dart-define="GMAPS_KEY=$BREIZH_BLOK_GMAPS_KEY" --dart-define="TOMTOM_APIKEY=$BREIZH_BLOK_TOMTOM_API_KEY"
```

### Compiler pour Android

```bash
flutter build appbundle --dart-define="API_HOST=$BREIZH_BLOK_API_HOST" --dart-define="GMAPS_KEY=$BREIZH_BLOK_GMAPS_KEY" --dart-define="SENTRY_DSN=$BREIZH_BLOK_SENTRY_DSN" --dart-define="TOMTOM_APIKEY=$BREIZH_BLOK_TOMTOM_API_KEY"
```

### Compiler pour iOS

```bash
flutter build ipa --dart-define="API_HOST=$BREIZH_BLOK_API_HOST" --dart-define="GMAPS_KEY=$BREIZH_BLOK_GMAPS_KEY" --dart-define="SENTRY_DSN=$BREIZH_BLOK_SENTRY_DSN" --dart-define="TOMTOM_APIKEY=$BREIZH_BLOK_TOMTOM_API_KEY"
```