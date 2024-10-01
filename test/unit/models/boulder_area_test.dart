import 'package:breizh_blok_mobile/constants.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/models/location.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BoulderArea', () {
    final boulderAreaRef = BoulderArea(
      iri: '/boulder_areas/1',
      name: 'Menez Ham',
      municipality: Municipality(iri: '/municipalities/1', name: 'Kerlouan'),
    );

    test('copyWith', () {
      final municipality =
          Municipality(iri: '/municipalities/23', name: 'Plaintel');
      final boulderArea = boulderAreaRef.copyWith(municipality: municipality);
      expect(boulderArea.municipality.name, 'Plaintel');
    });
    group('resolveLocation', () {
      test('return parkingLocation first', () {
        final b = boulderAreaRef.copyWith(
          centroid: Location(latitude: 90, longitude: 90),
          parkingLocation: Location(latitude: 0, longitude: 0),
        );

        expect(b.resolveLocation().latitude, 0);
      });

      test('return centroid if no parking location', () {
        final b = boulderAreaRef.copyWith(
          centroid: Location(latitude: 90, longitude: 90),
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

    group('computeStatsAsString', () {
      final boulderAreaRef = BoulderArea(
        iri: '/boulder_areas/1',
        name: 'Menez Ham',
        municipality: Municipality(iri: '/municipalities/1', name: 'Kerlouan'),
      );

      group('_computeStats', () {
        test('returns null if numberOfBoulders equals 0 or is null', () {
          expect(boulderAreaRef.computeStatsAsString(), null);

          final boulderArea2 = boulderAreaRef.copyWith(numberOfBoulders: 0);

          expect(boulderArea2.numberOfBoulders, 0);
          expect(boulderArea2.computeStatsAsString(), null);
        });

        test('return "n blocs"', () {
          final boulderArea = boulderAreaRef.copyWith(numberOfBoulders: 1);

          expect(boulderArea.numberOfBoulders, 1);
          expect(boulderArea.computeStatsAsString(), '1 bloc');

          final boulderArea2 = boulderAreaRef.copyWith(numberOfBoulders: 5);

          expect(boulderArea2.numberOfBoulders, 5);
          expect(boulderArea2.computeStatsAsString(), '5 blocs');

          final boulderArea3 = boulderAreaRef.copyWith(
            numberOfBoulders: 5,
            lowestGrade: const Grade(iri: '', name: '5c'),
          );

          expect(boulderArea3.numberOfBoulders, 5);
          expect(boulderArea3.lowestGrade?.name, '5c');
          expect(boulderArea3.highestGrade, null);
          expect(boulderArea3.computeStatsAsString(), '5 blocs');

          final boulderArea4 = boulderAreaRef.copyWith(
            numberOfBoulders: 5,
            highestGrade: const Grade(iri: '', name: '5c'),
          );

          expect(boulderArea4.numberOfBoulders, 5);
          expect(boulderArea4.highestGrade?.name, '5c');
          expect(boulderArea4.lowestGrade, null);
          expect(boulderArea4.computeStatsAsString(), '5 blocs');
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
          expect(boulderArea.computeStatsAsString(), '5 blocs en 5c');

          final boulderArea2 = boulderAreaRef.copyWith(
            numberOfBoulders: 5,
            lowestGrade: const Grade(iri: '', name: '5a'),
            highestGrade: const Grade(iri: '', name: '5c'),
          );

          expect(boulderArea2.numberOfBoulders, 5);
          expect(boulderArea2.highestGrade?.name, '5c');
          expect(boulderArea2.lowestGrade?.name, '5a');
          expect(boulderArea2.computeStatsAsString(), '5 blocs du 5a au 5c');
        });
      });
    });
  });
}
