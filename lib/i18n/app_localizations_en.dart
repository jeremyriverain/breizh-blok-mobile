// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get anErrorOccured => 'An error occured';

  @override
  String get areas => 'Areas';

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

    return 'between $minString and $maxString meters';
  }

  @override
  String get boulderArea => 'Boulder area';

  @override
  String get boulderAreas => 'Boulder areas';

  @override
  String get boulders => 'Boulders';

  @override
  String get checkYourConnection => 'Check your internet connection and try again';

  @override
  String get clear => 'Clear';

  @override
  String get closeTheGallery => 'Close the gallery';

  @override
  String get closeTheModal => 'Close the modal';

  @override
  String get description => 'Description';

  @override
  String get distributionOfBoulders => 'Distribution of the boulders';

  @override
  String distributionOfNBoulders({required num num}) {
    final intl.NumberFormat numNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String numString = numNumberFormat.format(num);

    return 'Distribution of the $numString boulders';
  }

  @override
  String get download => 'Download';

  @override
  String get downloads => 'Downloads';

  @override
  String get downloadedRecently => 'Downloaded recently';

  @override
  String get errorOccuredWhileDisplayingMap => 'An error occured while displaying the map';

  @override
  String get errorOccuredWhileFetchingBoulders => 'An error occured while fetching boulders';

  @override
  String get fetchingData => 'Fetching data';

  @override
  String get filter => 'Filter';

  @override
  String get goToHomepage => 'Go to homepage';

  @override
  String get grade => 'Grade';

  @override
  String get height => 'Height';

  @override
  String get iAccept => 'I accept';

  @override
  String get image => 'Image';

  @override
  String get itinerary => 'Itinerary';

  @override
  String get itineraryToTheBoulderArea => 'Itinerary to the boulder area';

  @override
  String get itineraryToTheParking => 'Itinerary to parking';

  @override
  String get language => 'Language';

  @override
  String lessThanNMeters({required num value}) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String valueString = valueNumberFormat.format(value);

    return 'Less than $valueString meters';
  }

  @override
  String get map => 'Map';

  @override
  String get max => 'max';

  @override
  String get minGrade => 'Min grade';

  @override
  String moreThanNMeters({required num value}) {
    final intl.NumberFormat valueNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String valueString = valueNumberFormat.format(value);

    return 'More than $valueString meters';
  }

  @override
  String get municipalities => 'Municipalities';

  @override
  String get municipality => 'Municipality';

  @override
  String get myProfile => 'My profile';

  @override
  String nBoulders({required num count}) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'boulders',
      one: 'boulder',
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
      other: 'Boulders on the same rock',
      one: 'Boulder on the same rock',
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
      other: '$countString boulders rated $grade',
      one: '$countString boulder rated $grade',
    );
    return '$_temp0';
  }

  @override
  String nBouldersRatedBetween({required num count, required String minGrade, required String maxGrade}) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    return '$countString boulders rated between $minGrade and $maxGrade';
  }

  @override
  String get noConnection => 'No connection';

  @override
  String get noDownload => 'There is no download';

  @override
  String get noDownloadHelper => 'It is possible to download boulder areas in order to be able to access it without an internet connection';

  @override
  String get noResults => 'No results';

  @override
  String get noResultsMatchYourSearchCriteria => 'No results match your search criteria';

  @override
  String get pageNotFound => '404 - Page not found';

  @override
  String get pageNotFoundDescription => 'The page you are looking for does not exist or has been moved.';

  @override
  String get parkingOfTheBoulderArea => 'Parking of ';

  @override
  String get returnToTheTop => 'Return to the top';

  @override
  String get searchForBoulders => 'Search for boulders';

  @override
  String get share => 'Share';

  @override
  String shareableBoulder({required String boulderName, required String boulderAreaName, required String boulderIri}) {
    return 'Breizh Blok recommends the boulder $boulderName in $boulderAreaName. More info on https://breizh-blok.fr/boulders/$boulderIri';
  }

  @override
  String shareableBoulderArea({required String boulderAreaName, required String municipalityName, required String boulderAreaIri}) {
    return 'Breizh Blok recommends the boulder area $boulderAreaName in $municipalityName. More info on https://breizh-blok.fr/boulder-areas/$boulderAreaIri';
  }

  @override
  String shareableMunicipality({required String municipalityName, required String municipalityIri}) {
    return 'Breizh Blok recommends the boulders located in $municipalityName. More info on https://breizh-blok.fr/municipalities/$municipalityIri';
  }

  @override
  String get sort => 'Sort';

  @override
  String get sortedAlphabetically => 'A - Z';

  @override
  String get sortBy => 'Sort by';

  @override
  String get termsOfUse => 'Terms of use';

  @override
  String get termsOfUseContent => 'Bouldering is a dangerous activity. Its practice is under the entire responsibility of the practitioners. Breizh Blok declines all responsibility in the event of an accident.';

  @override
  String get theEasiest => 'The easiest';

  @override
  String get theHardest => 'The hardest';

  @override
  String get theMostRecent => 'The most recent';

  @override
  String get tryAgain => 'Try again';
}
