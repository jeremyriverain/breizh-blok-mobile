// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get anErrorOccured => 'Une erreur est survenue';

  @override
  String get anErrorOccuredWhileDisplayingMap =>
      'Une erreur est survenue pendant l\'affichage de la carte';

  @override
  String get areas => 'Sites';

  @override
  String betweenXAndYMeters({required num min, required num max}) {
    final intl.NumberFormat minNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String minString = minNumberFormat.format(min);
    final intl.NumberFormat maxNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String maxString = maxNumberFormat.format(max);

    return 'Entre $minString et ${maxString}m';
  }

  @override
  String get boulderArea => 'Secteur';

  @override
  String get boulderAreas => 'Secteurs';

  @override
  String get boulders => 'Blocs';

  @override
  String get cancel => 'Annuler';

  @override
  String get changeStyleMap => 'Modifier le style de la carte';

  @override
  String get checkYourConnection =>
      'Vérifiez votre connexion internet et essayez à nouveau';

  @override
  String get clear => 'Effacer';

  @override
  String get closeTheGallery => 'Fermer la galerie d\'images';

  @override
  String get closeTheModal => 'Fermer la boîte de dialogue';

  @override
  String get comingSoon => 'Bientôt disponible';

  @override
  String get comments => 'Commentaires';

  @override
  String get contribute => 'Contribuer';

  @override
  String get contributeTo => 'Contribuer à';

  @override
  String get description => 'Description';

  @override
  String get details => 'Détails';

  @override
  String get displayFirst => 'Afficher en 1er:';

  @override
  String get distributionOfBoulders => 'Répartition des blocs';

  @override
  String distributionOfNBoulders({required num num}) {
    final intl.NumberFormat numNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String numString = numNumberFormat.format(num);

    return 'Répartition des $numString blocs';
  }

  @override
  String get download => 'Télécharger';

  @override
  String get downloads => 'Téléchargements';

  @override
  String get downloadedRecently => 'Téléchargés récemment';

  @override
  String get errorOccuredWhileDisplayingMap =>
      'Une erreur est survenue pendant l\'affichage de la carte';

  @override
  String get errorOccuredWhileFetchingBoulders =>
      'Une erreur est survenue lors de la récupération des blocs';

  @override
  String get fetchingData => 'Récupération des données en cours';

  @override
  String get filter => 'Filtrer';

  @override
  String get getMyLocation => 'Afficher ma position';

  @override
  String get goToHomepage => 'Aller à l\'accueil';

  @override
  String get grade => 'Cotation';

  @override
  String get height => 'Hauteur';

  @override
  String get iAccept => 'J\'accepte';

  @override
  String get image => 'Image';

  @override
  String get itinerary => 'Itinéraire';

  @override
  String get itineraryToTheBoulderArea => 'Itinéraire vers le secteur';

  @override
  String get itineraryToTheParking => 'Itinéraire vers le parking';

  @override
  String get language => 'Langage';

  @override
  String lessThanNMeters({required num value}) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String valueString = valueNumberFormat.format(value);

    return 'Moins de ${valueString}m';
  }

  @override
  String get login => 'Se connecter';

  @override
  String get logout => 'Se déconnecter';

  @override
  String get makeSuggestion => 'Adresser un commentaire, une suggestion';

  @override
  String get map => 'Carte';

  @override
  String get max => 'max';

  @override
  String get message => 'Message';

  @override
  String get minGrade => 'Cotation min';

  @override
  String moreThanNMeters({required num value}) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String valueString = valueNumberFormat.format(value);

    return 'Plus de ${valueString}m';
  }

  @override
  String get municipalities => 'Communes';

  @override
  String get municipality => 'Commune';

  @override
  String get myProfile => 'Mon profil';

  @override
  String nBoulders({required num count}) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'blocs',
      one: 'bloc',
    );
    return '$_temp0';
  }

  @override
  String nBouldersOnTheSameRock({required num count}) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Blocs sur le même rocher',
      one: 'Bloc sur le même rocher',
    );
    return '$_temp0';
  }

  @override
  String nBouldersRated({required num count, required String grade}) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString blocs en $grade',
      one: '$countString bloc en $grade',
    );
    return '$_temp0';
  }

  @override
  String nBouldersRatedBetween({
    required num count,
    required String minGrade,
    required String maxGrade,
  }) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    return '$countString blocs du $minGrade au $maxGrade';
  }

  @override
  String get noConnection => 'Aucune connexion';

  @override
  String get noDownload => 'Aucun téléchargement';

  @override
  String get noDownloadHelper =>
      'Il est possible de télécharger des secteurs de bloc afin de pouvoir y accéder même sans connexion internet.';

  @override
  String get noResults => 'Aucun résultat';

  @override
  String get noResultsMatchYourSearchCriteria =>
      'Aucun résultat ne correspond à vos critères de recherche';

  @override
  String get pageNotFound => '404 - Page non trouvée';

  @override
  String get pageNotFoundDescription =>
      'La page que vous recherchez n\'existe pas ou a été déplacée.';

  @override
  String get parkingOfTheBoulderArea => 'Parking du secteur';

  @override
  String get relevantBoulder => 'Bloc concerné';

  @override
  String get returnToTheTop => 'Revenir en haut';

  @override
  String get searchForBoulders => 'Rechercher bloc, secteur, commune';

  @override
  String get send => 'Envoyer';

  @override
  String get share => 'Partager';

  @override
  String shareableBoulder({
    required String boulderName,
    required String boulderAreaName,
    required String boulderIri,
  }) {
    return 'Breizh Blok recommande le bloc $boulderName dans le secteur $boulderAreaName. Voir https://breizh-blok.fr/boulders/$boulderIri';
  }

  @override
  String shareableBoulderArea({
    required String boulderAreaName,
    required String municipalityName,
    required String boulderAreaIri,
  }) {
    return 'Breizh Blok recommande le secteur $boulderAreaName à $municipalityName. Voir https://breizh-blok.fr/boulder-areas/$boulderAreaIri';
  }

  @override
  String shareableMunicipality({
    required String municipalityName,
    required String municipalityIri,
  }) {
    return 'Breizh Blok recommande les blocs de $municipalityName. Voir https://breizh-blok.fr/municipalities/$municipalityIri';
  }

  @override
  String get showDetails => 'Voir détails';

  @override
  String get sort => 'Trier';

  @override
  String get sortedAlphabetically => 'A - Z';

  @override
  String get sortBy => 'Trier par';

  @override
  String get specifyBoulderLocation => 'Affiner l\'emplacement du bloc';

  @override
  String get suggestions => 'Suggestions';

  @override
  String get termsOfUse => 'Conditions d\'utilisation';

  @override
  String get termsOfUseContent =>
      'L\'escalade est un sport à risque. Sa pratique est sous l\'entière responsabilité des pratiquants. Breizh Blok décline toute responsabilité en cas d\'accident.';

  @override
  String get theEasiest => 'Les plus faciles';

  @override
  String get theHardest => 'Les plus difficiles';

  @override
  String get theMostRecent => 'Les plus récents';

  @override
  String get tryAgain => 'Essayer à nouveau';

  @override
  String get validatorsRequired => 'Ce champ est obligatoire';

  @override
  String get yourMessageHasBeenSent => 'Merci, votre message a été envoyé';
}
