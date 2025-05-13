# Breizh Blok

Application mobile (disponible sur iOS et Android) répertoriant les blocs d'escalade en Bretagne

## Pré-requis

Installez [FVM](https://fvm.app/) qui est utilisé comme gestionnaire de versions de Dart et Flutter.

## Installation

Définissez dans votre environnement les variables d'environnement suivantes:

- BREIZH_BLOK_API_HOST
- BREIZH_BLOK_MIX_PANEL_TOKEN
- BREIZH_BLOK_MAPBOX_TOKEN
- BREIZH_BLOK_SENTRY_URL
- BREIZH_BLOK_AUTH0_CLIENT_ID

```bash
fvm flutter pub get
fvm dart run build_runner build
```

## Commandes utiles

### Démarrer l'application en mode DEV

```bash
fvm flutter run --debug
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
fvm flutter test integration_test --dart-define="REQUEST_TIMEOUT=20"
```

### Générer les icônes

```bash
fvm dart run flutter_launcher_icons
```