import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/grade/grade.dart';
import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:breizh_blok_mobile/domain/models/municipality/municipality.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BoulderArea', () {
    late AppLocalizations localizations;

    setUp(() async {
      localizations = await AppLocalizations.delegate.load(
        const Locale('fr'),
      );
    });

    const boulderAreaRef = BoulderArea(
      iri: '/boulder_areas/1',
      name: 'Menez Ham',
      municipality: Municipality(iri: '/municipalities/1', name: 'Kerlouan'),
    );

    test('copyWith', () {
      const municipality =
          Municipality(iri: '/municipalities/23', name: 'Plaintel');
      final boulderArea = boulderAreaRef.copyWith(municipality: municipality);
      expect(boulderArea.municipality?.name, 'Plaintel');
    });
    group('resolveLocation', () {
      test('return parkingLocation first', () {
        final b = boulderAreaRef.copyWith(
          centroid: const Location(latitude: 90, longitude: 90),
          parkingLocation: const Location(latitude: 0, longitude: 0),
        );

        expect(b.resolveLocation().latitude, 0);
      });

      test('return centroid if no parking location', () {
        final b = boulderAreaRef.copyWith(
          centroid: const Location(latitude: 90, longitude: 90),
        );

        expect(b.resolveLocation().latitude, 90);
      });

      test('return default initial position if no parking location or centroid',
          () {
        expect(
          boulderAreaRef.resolveLocation().latitude,
          kDefaultInitialPosition.latitude,
        );
      });
    });

    group('nBouldersRated', () {
      const boulderAreaRef = BoulderArea(
        iri: '/boulder_areas/1',
        name: 'Menez Ham',
        municipality: Municipality(iri: '/municipalities/1', name: 'Kerlouan'),
      );

      test('returns null if numberOfBoulders equals 0 or is null', () {
        expect(boulderAreaRef.nBouldersRated(localizations), null);

        final boulderArea2 = boulderAreaRef.copyWith(numberOfBoulders: 0);

        expect(boulderArea2.numberOfBoulders, 0);
        expect(boulderArea2.nBouldersRated(localizations), null);
      });

      test('return "n blocs"', () {
        final boulderArea = boulderAreaRef.copyWith(numberOfBoulders: 1);

        expect(boulderArea.numberOfBoulders, 1);
        expect(boulderArea.nBouldersRated(localizations), '1 bloc');

        final boulderArea2 = boulderAreaRef.copyWith(numberOfBoulders: 5);

        expect(boulderArea2.numberOfBoulders, 5);
        expect(boulderArea2.nBouldersRated(localizations), '5 blocs');

        final boulderArea3 = boulderAreaRef.copyWith(
          numberOfBoulders: 5,
          lowestGrade: const Grade(iri: '', name: '5c'),
        );

        expect(boulderArea3.numberOfBoulders, 5);
        expect(boulderArea3.lowestGrade?.name, '5c');
        expect(boulderArea3.highestGrade, null);
        expect(boulderArea3.nBouldersRated(localizations), '5 blocs');

        final boulderArea4 = boulderAreaRef.copyWith(
          numberOfBoulders: 5,
          highestGrade: const Grade(iri: '', name: '5c'),
        );

        expect(boulderArea4.numberOfBoulders, 5);
        expect(boulderArea4.highestGrade?.name, '5c');
        expect(boulderArea4.lowestGrade, null);
        expect(boulderArea4.nBouldersRated(localizations), '5 blocs');
      });

      test('return "n blocs en ..."', () {
        final boulderArea = boulderAreaRef.copyWith(
          numberOfBoulders: 5,
          lowestGrade: const Grade(iri: '', name: '5c'),
          highestGrade: const Grade(iri: '', name: '5c'),
        );

        expect(boulderArea.numberOfBoulders, 5);
        expect(boulderArea.lowestGrade?.name, '5c');
        expect(boulderArea.highestGrade?.name, '5c');
        expect(boulderArea.nBouldersRated(localizations), '5 blocs en 5c');

        final boulderArea2 = boulderAreaRef.copyWith(
          numberOfBoulders: 5,
          lowestGrade: const Grade(iri: '', name: '5a'),
          highestGrade: const Grade(iri: '', name: '5c'),
        );

        expect(boulderArea2.numberOfBoulders, 5);
        expect(boulderArea2.highestGrade?.name, '5c');
        expect(boulderArea2.lowestGrade?.name, '5a');
        expect(
          boulderArea2.nBouldersRated(localizations),
          '5 blocs du 5a au 5c',
        );

        final boulderArea3 = boulderAreaRef.copyWith(
          numberOfBoulders: 1,
          lowestGrade: const Grade(iri: '', name: '5c'),
          highestGrade: const Grade(iri: '', name: '6a'),
        );

        expect(boulderArea3.numberOfBoulders, 1);
        expect(boulderArea3.lowestGrade?.name, '5c');
        expect(boulderArea3.highestGrade?.name, '6a');
        expect(boulderArea3.nBouldersRated(localizations), '1 bloc en 5c');
      });
    });
  });
}
