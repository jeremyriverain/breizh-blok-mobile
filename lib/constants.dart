import 'package:google_maps_flutter/google_maps_flutter.dart';

const kDefaultInitialPosition = LatLng(
  48.066152,
  -2.967056,
);

const kSizeSimpleMarker = 75;

const kParkingIcon = 'assets/parking-icon.png';

const kLocalePrefs = 'locale';

const kRequestDefaultTimeout = Duration(
  seconds: int.fromEnvironment('REQUEST_TIMEOUT', defaultValue: 7),
);
