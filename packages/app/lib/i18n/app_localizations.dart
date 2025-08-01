import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'i18n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('fr'),
    Locale('en'),
  ];

  /// No description provided for @anErrorOccured.
  ///
  /// In en, this message translates to:
  /// **'An error occured'**
  String get anErrorOccured;

  /// No description provided for @anErrorOccuredWhileDisplayingMap.
  ///
  /// In en, this message translates to:
  /// **'An error occured while displaying the map'**
  String get anErrorOccuredWhileDisplayingMap;

  /// No description provided for @areas.
  ///
  /// In en, this message translates to:
  /// **'Areas'**
  String get areas;

  /// No description provided for @betweenXAndYMeters.
  ///
  /// In en, this message translates to:
  /// **'between {min} and {max} meters'**
  String betweenXAndYMeters({required num min, required num max});

  /// No description provided for @boulderArea.
  ///
  /// In en, this message translates to:
  /// **'Boulder area'**
  String get boulderArea;

  /// No description provided for @boulderAreas.
  ///
  /// In en, this message translates to:
  /// **'Boulder areas'**
  String get boulderAreas;

  /// No description provided for @boulders.
  ///
  /// In en, this message translates to:
  /// **'Boulders'**
  String get boulders;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @changeStyleMap.
  ///
  /// In en, this message translates to:
  /// **'Change style map'**
  String get changeStyleMap;

  /// No description provided for @checkYourConnection.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection and try again'**
  String get checkYourConnection;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @closeTheGallery.
  ///
  /// In en, this message translates to:
  /// **'Close the gallery'**
  String get closeTheGallery;

  /// No description provided for @closeTheModal.
  ///
  /// In en, this message translates to:
  /// **'Close the modal'**
  String get closeTheModal;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// No description provided for @contribute.
  ///
  /// In en, this message translates to:
  /// **'Contribute'**
  String get contribute;

  /// No description provided for @contributeTo.
  ///
  /// In en, this message translates to:
  /// **'Contribute to'**
  String get contributeTo;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @displayFirst.
  ///
  /// In en, this message translates to:
  /// **'Display first:'**
  String get displayFirst;

  /// No description provided for @distributionOfBoulders.
  ///
  /// In en, this message translates to:
  /// **'Distribution of the boulders'**
  String get distributionOfBoulders;

  /// No description provided for @distributionOfNBoulders.
  ///
  /// In en, this message translates to:
  /// **'Distribution of the {num} boulders'**
  String distributionOfNBoulders({required num num});

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @downloads.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get downloads;

  /// No description provided for @downloadedRecently.
  ///
  /// In en, this message translates to:
  /// **'Downloaded recently'**
  String get downloadedRecently;

  /// No description provided for @errorOccuredWhileDisplayingMap.
  ///
  /// In en, this message translates to:
  /// **'An error occured while displaying the map'**
  String get errorOccuredWhileDisplayingMap;

  /// No description provided for @errorOccuredWhileFetchingBoulders.
  ///
  /// In en, this message translates to:
  /// **'An error occured while fetching boulders'**
  String get errorOccuredWhileFetchingBoulders;

  /// No description provided for @fetchingData.
  ///
  /// In en, this message translates to:
  /// **'Fetching data'**
  String get fetchingData;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @getMyLocation.
  ///
  /// In en, this message translates to:
  /// **'Get my location'**
  String get getMyLocation;

  /// No description provided for @goToHomepage.
  ///
  /// In en, this message translates to:
  /// **'Go to homepage'**
  String get goToHomepage;

  /// No description provided for @grade.
  ///
  /// In en, this message translates to:
  /// **'Grade'**
  String get grade;

  /// No description provided for @height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// No description provided for @iAccept.
  ///
  /// In en, this message translates to:
  /// **'I accept'**
  String get iAccept;

  /// No description provided for @image.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get image;

  /// No description provided for @itinerary.
  ///
  /// In en, this message translates to:
  /// **'Itinerary'**
  String get itinerary;

  /// No description provided for @itineraryToTheBoulderArea.
  ///
  /// In en, this message translates to:
  /// **'Itinerary to the boulder area'**
  String get itineraryToTheBoulderArea;

  /// No description provided for @itineraryToTheParking.
  ///
  /// In en, this message translates to:
  /// **'Itinerary to parking'**
  String get itineraryToTheParking;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @latitude.
  ///
  /// In en, this message translates to:
  /// **'Latitude'**
  String get latitude;

  /// No description provided for @lessThanNMeters.
  ///
  /// In en, this message translates to:
  /// **'Less than {value} meters'**
  String lessThanNMeters({required num value});

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @longitude.
  ///
  /// In en, this message translates to:
  /// **'Longitude'**
  String get longitude;

  /// No description provided for @makeSuggestion.
  ///
  /// In en, this message translates to:
  /// **'Post a comment, make a suggestion'**
  String get makeSuggestion;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @mapFormHelper.
  ///
  /// In en, this message translates to:
  /// **'The location of the boulder {boulderName} is represented by the marker on the map. By pressing and holding the marker, you can drag and move it to change its coordinates.'**
  String mapFormHelper({required String boulderName});

  /// No description provided for @max.
  ///
  /// In en, this message translates to:
  /// **'max'**
  String get max;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @minGrade.
  ///
  /// In en, this message translates to:
  /// **'Min grade'**
  String get minGrade;

  /// No description provided for @moreThanNMeters.
  ///
  /// In en, this message translates to:
  /// **'More than {value} meters'**
  String moreThanNMeters({required num value});

  /// No description provided for @municipalities.
  ///
  /// In en, this message translates to:
  /// **'Municipalities'**
  String get municipalities;

  /// No description provided for @municipality.
  ///
  /// In en, this message translates to:
  /// **'Municipality'**
  String get municipality;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get myProfile;

  /// No description provided for @nBoulders.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{boulder} other{boulders}}'**
  String nBoulders({required num count});

  /// No description provided for @nBouldersOnTheSameRock.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Boulder on the same rock} other{Boulders on the same rock}}'**
  String nBouldersOnTheSameRock({required num count});

  /// No description provided for @nBouldersRated.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{{count} boulder rated {grade}} other{{count} boulders rated {grade}}}'**
  String nBouldersRated({required num count, required String grade});

  /// No description provided for @nBouldersRatedBetween.
  ///
  /// In en, this message translates to:
  /// **'{count} boulders rated between {minGrade} and {maxGrade}'**
  String nBouldersRatedBetween({
    required num count,
    required String minGrade,
    required String maxGrade,
  });

  /// No description provided for @noConnection.
  ///
  /// In en, this message translates to:
  /// **'No connection'**
  String get noConnection;

  /// No description provided for @noDownload.
  ///
  /// In en, this message translates to:
  /// **'There is no download'**
  String get noDownload;

  /// No description provided for @noDownloadHelper.
  ///
  /// In en, this message translates to:
  /// **'It is possible to download boulder areas in order to be able to access it without an internet connection'**
  String get noDownloadHelper;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get noResults;

  /// No description provided for @noResultsMatchYourSearchCriteria.
  ///
  /// In en, this message translates to:
  /// **'No results match your search criteria'**
  String get noResultsMatchYourSearchCriteria;

  /// No description provided for @pageNotFound.
  ///
  /// In en, this message translates to:
  /// **'404 - Page not found'**
  String get pageNotFound;

  /// No description provided for @pageNotFoundDescription.
  ///
  /// In en, this message translates to:
  /// **'The page you are looking for does not exist or has been moved.'**
  String get pageNotFoundDescription;

  /// No description provided for @parkingOfTheBoulderArea.
  ///
  /// In en, this message translates to:
  /// **'Parking of '**
  String get parkingOfTheBoulderArea;

  /// No description provided for @relevantBoulder.
  ///
  /// In en, this message translates to:
  /// **'Relevant boulder'**
  String get relevantBoulder;

  /// No description provided for @returnToTheTop.
  ///
  /// In en, this message translates to:
  /// **'Return to the top'**
  String get returnToTheTop;

  /// No description provided for @searchForBoulders.
  ///
  /// In en, this message translates to:
  /// **'Search for boulders'**
  String get searchForBoulders;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @shareableBoulder.
  ///
  /// In en, this message translates to:
  /// **'Breizh Blok recommends the boulder {boulderName} in {boulderAreaName}. More info on https://breizh-blok.fr/boulders/{boulderIri}'**
  String shareableBoulder({
    required String boulderName,
    required String boulderAreaName,
    required String boulderIri,
  });

  /// No description provided for @shareableBoulderArea.
  ///
  /// In en, this message translates to:
  /// **'Breizh Blok recommends the boulder area {boulderAreaName} in {municipalityName}. More info on https://breizh-blok.fr/boulder-areas/{boulderAreaIri}'**
  String shareableBoulderArea({
    required String boulderAreaName,
    required String municipalityName,
    required String boulderAreaIri,
  });

  /// No description provided for @shareableMunicipality.
  ///
  /// In en, this message translates to:
  /// **'Breizh Blok recommends the boulders located in {municipalityName}. More info on https://breizh-blok.fr/municipalities/{municipalityIri}'**
  String shareableMunicipality({
    required String municipalityName,
    required String municipalityIri,
  });

  /// No description provided for @showDetails.
  ///
  /// In en, this message translates to:
  /// **'Show details'**
  String get showDetails;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @sortedAlphabetically.
  ///
  /// In en, this message translates to:
  /// **'A - Z'**
  String get sortedAlphabetically;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get sortBy;

  /// No description provided for @specifyBoulderLocation.
  ///
  /// In en, this message translates to:
  /// **'Specifiy the boulder\'s location'**
  String get specifyBoulderLocation;

  /// No description provided for @submitLocation.
  ///
  /// In en, this message translates to:
  /// **'Submit location'**
  String get submitLocation;

  /// No description provided for @suggestions.
  ///
  /// In en, this message translates to:
  /// **'Suggestions'**
  String get suggestions;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get termsOfUse;

  /// No description provided for @termsOfUseContent.
  ///
  /// In en, this message translates to:
  /// **'Bouldering is a dangerous activity. Its practice is under the entire responsibility of the practitioners. Breizh Blok declines all responsibility in the event of an accident.'**
  String get termsOfUseContent;

  /// No description provided for @thanksWeWillReviewYourContribution.
  ///
  /// In en, this message translates to:
  /// **'Thanks! We\'ll review your contribution.'**
  String get thanksWeWillReviewYourContribution;

  /// No description provided for @theEasiest.
  ///
  /// In en, this message translates to:
  /// **'The easiest'**
  String get theEasiest;

  /// No description provided for @theHardest.
  ///
  /// In en, this message translates to:
  /// **'The hardest'**
  String get theHardest;

  /// No description provided for @theMostRecent.
  ///
  /// In en, this message translates to:
  /// **'The most recent'**
  String get theMostRecent;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @validatorsRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get validatorsRequired;

  /// No description provided for @yourMessageHasBeenSent.
  ///
  /// In en, this message translates to:
  /// **'Thanks, your message has been sent'**
  String get yourMessageHasBeenSent;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
