# Breizh Blok

Application mobile (disponible sur iOS et Android) répertoriant les blocs d'escalade en Bretagne

## Configuration

Définissez les variables d'environnement suivantes:

- `BREIZH_BLOK_API_HOST` (hôte de l'API, par exemple `api.example.com`)
- `BREIZH_BLOK_GMAPS_KEY` (clé API pour Google Maps)
- `BREIZH_BLOK_SENTRY_DSN` (facultatif. adresse DSN fournie par Sentry)

## Pré-requis

Installez [FVM](https://fvm.app/) qui est utilisé comme gestionnaire de versions de Dart et Flutter.

## Commandes utiles

### Démarrer l'application en mode DEV

```bash
fvm flutter run --dart-define="API_HOST=$BREIZH_BLOK_API_HOST" --dart-define="GMAPS_KEY=$BREIZH_BLOK_GMAPS_KEY" --dart-define="MIX_PANEL_TOKEN=$BREIZH_BLOK_MIX_PANEL_TOKEN_DEV" --debug
```

### Analyse statique de code

```bash
fvm flutter analyze
```

### Exécuter les tests unitaires et tests de widgets

```bash
fvm flutter test
```

### Exécuter les tests E2E

```bash
fvm flutter test integration_test --dart-define="API_HOST=$BREIZH_BLOK_API_HOST" --dart-define="GMAPS_KEY=$BREIZH_BLOK_GMAPS_KEY" --dart-define="REQUEST_TIMEOUT=20" 
```

### Compiler pour Android

```bash
fvm flutter build appbundle --dart-define="API_HOST=$BREIZH_BLOK_API_HOST" --dart-define="GMAPS_KEY=$BREIZH_BLOK_GMAPS_KEY" --dart-define="SENTRY_DSN=$BREIZH_BLOK_SENTRY_DSN" --dart-define="MIX_PANEL_TOKEN=$BREIZH_BLOK_MIX_PANEL_TOKEN"
```

### Compiler pour iOS

```bash
fvm flutter build ipa --dart-define="API_HOST=$BREIZH_BLOK_API_HOST" --dart-define="GMAPS_KEY=$BREIZH_BLOK_GMAPS_KEY" --dart-define="SENTRY_DSN=$BREIZH_BLOK_SENTRY_DSN" --dart-define="MIX_PANEL_TOKEN=$BREIZH_BLOK_MIX_PANEL_TOKEN"
```

### Exécuter la génération de code

```bash
fvm dart run build_runner build
```