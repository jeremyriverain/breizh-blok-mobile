import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_location_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ContributeBoulderLocationForm', () {
    group('latitude', () {
      test(
        '''
Given the field "latitude" is null,
Then this field is invalid
''',
        () async {
          final form = ContributeBoulderLocationForm(latitude: 0, longitude: 0);

          final latitudeKey = ContributeBoulderLocationForm.formKeys.latitude;

          form.control(latitudeKey).value = 1.toDouble();

          expect(form.errors.keys.contains(latitudeKey), isFalse);

          form.control(latitudeKey).value = null;

          expect(
            form.errors[latitudeKey],
            equals({
              'required': true,
              'max': {'max': 90, 'actual': null},
              'min': {'min': -90, 'actual': null},
            }),
          );
        },
      );

      test(
        '''
Given the field "latitude" is greater than 90,
Then this field is invalid
''',
        () async {
          final form = ContributeBoulderLocationForm(latitude: 0, longitude: 0);

          final latitudeKey = ContributeBoulderLocationForm.formKeys.latitude;

          form.control(latitudeKey).value = 90.toDouble();

          expect(form.errors.keys.contains(latitudeKey), isFalse);

          form.control(latitudeKey).value = 91.toDouble();

          expect(form.errors[latitudeKey], {
            'max': {'max': 90, 'actual': 91.0},
          });
        },
      );

      test(
        '''
Given the field "latitude" is less than 90,
Then this field is invalid
''',
        () async {
          final form = ContributeBoulderLocationForm(latitude: 0, longitude: 0);

          final latitudeKey = ContributeBoulderLocationForm.formKeys.latitude;

          form.control(latitudeKey).value = -90.toDouble();

          expect(form.errors.keys.contains(latitudeKey), isFalse);

          form.control(latitudeKey).value = -91.toDouble();

          expect(form.errors[latitudeKey], {
            'min': {'min': -90, 'actual': -91.0},
          });
        },
      );
    });

    group('longitude', () {
      test(
        '''
Given the field "longitude" is null,
Then this field is invalid
''',
        () async {
          final form = ContributeBoulderLocationForm(latitude: 0, longitude: 0);

          final longitudeKey = ContributeBoulderLocationForm.formKeys.longitude;

          form.control(longitudeKey).value = 1.toDouble();

          expect(form.errors.keys.contains(longitudeKey), isFalse);

          form.control(longitudeKey).value = null;

          expect(
            form.errors[longitudeKey],
            equals({
              'required': true,
              'max': {'max': 180, 'actual': null},
              'min': {'min': -180, 'actual': null},
            }),
          );
        },
      );

      test(
        '''
Given the field "longitude" is greater than 180,
Then this field is invalid
''',
        () async {
          final form = ContributeBoulderLocationForm(latitude: 0, longitude: 0);

          final longitudeKey = ContributeBoulderLocationForm.formKeys.longitude;

          form.control(longitudeKey).value = 180.toDouble();

          expect(form.errors.keys.contains(longitudeKey), isFalse);

          form.control(longitudeKey).value = 181.toDouble();

          expect(form.errors[longitudeKey], {
            'max': {'max': 180, 'actual': 181.0},
          });
        },
      );

      test(
        '''
Given the field "longitude" is less than 180,
Then this field is invalid
''',
        () async {
          final form = ContributeBoulderLocationForm(latitude: 0, longitude: 0);

          final longitudeKey = ContributeBoulderLocationForm.formKeys.longitude;

          form.control(longitudeKey).value = -180.toDouble();

          expect(form.errors.keys.contains(longitudeKey), isFalse);

          form.control(longitudeKey).value = -181.toDouble();

          expect(form.errors[longitudeKey], {
            'min': {'min': -180, 'actual': -181.0},
          });
        },
      );
    });

    group('form', () {
      test(
        '''
Given the fields "longitude" and "latitude" have not changed
Then the form is invalid
''',
        () async {
          final form = ContributeBoulderLocationForm(latitude: 0, longitude: 0);

          expect(form.valid, isFalse);
        },
      );

      test(
        '''
Given the field "longitude" has not changed
But the field "latitude" has changed
Then the form is valid
''',
        () async {
          final form = ContributeBoulderLocationForm(latitude: 0, longitude: 0);

          final longitudeKey = ContributeBoulderLocationForm.formKeys.longitude;

          form.control(longitudeKey).value = -10.toDouble();
          expect(form.valid, isTrue);
        },
      );

      test(
        '''
Given the field "latitude" has not changed
But the field "longitude" has changed
Then the form is valid
''',
        () async {
          final form = ContributeBoulderLocationForm(latitude: 0, longitude: 0);

          final latitudeKey = ContributeBoulderLocationForm.formKeys.latitude;

          form.control(latitudeKey).value = -10.toDouble();

          expect(form.valid, isTrue);
        },
      );
    });
  });
}
