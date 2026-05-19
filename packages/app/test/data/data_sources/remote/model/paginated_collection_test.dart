import 'package:breizh_blok_mobile/data/data_sources/remote/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';

void main() {
  group('PaginatedCollection', () {
    test('==', () {
      expect(
        const PaginatedCollection(
          items: [fakeBoulder],
          totalItems: 1,
          nextPage: 2,
        ),
        equals(
          const PaginatedCollection(
            items: [fakeBoulder],
            totalItems: 1,
            nextPage: 2,
          ),
        ),
      );
    });

    test('copyWith', () {
      expect(
        const PaginatedCollection(
          items: [fakeBoulder],
          totalItems: 1,
          nextPage: 2,
        ).copyWith(items: [fakeBoulder, fakeBoulder]),
        equals(
          const PaginatedCollection(
            items: [fakeBoulder, fakeBoulder],
            totalItems: 1,
            nextPage: 2,
          ),
        ),
      );
    });

    group('fromApi', () {
      test('when next page is null', () {
        const o = {
          'hydra:totalItems': 2,
          'hydra:member': [
            {'@id': '/grades/2', '@type': 'Grade', 'name': '5'},
            {'@id': '/grades/3', '@type': 'Grade', 'name': '5+'},
          ],

          'hydra:view': <String, dynamic>{},
        };
        expect(
          PaginatedCollection.fromApi(o, Grade.fromJson),
          equals(
            const PaginatedCollection(
              items: [
                Grade(iri: '/grades/2', name: '5'),
                Grade(iri: '/grades/3', name: '5+'),
              ],
              totalItems: 2,
            ),
          ),
        );
      });

      test('when hydra:view does not exist', () {
        const o = {
          'hydra:totalItems': 2,
          'hydra:member': [
            {'@id': '/grades/2', '@type': 'Grade', 'name': '5'},
            {'@id': '/grades/3', '@type': 'Grade', 'name': '5+'},
          ],
        };
        expect(
          PaginatedCollection.fromApi(o, Grade.fromJson),
          equals(
            const PaginatedCollection(
              items: [
                Grade(iri: '/grades/2', name: '5'),
                Grade(iri: '/grades/3', name: '5+'),
              ],
              totalItems: 2,
            ),
          ),
        );
      });

      test('when items are empty', () {
        const o = {
          'hydra:totalItems': 2,
          'hydra:member': <Map<String, dynamic>>[],
        };
        expect(
          PaginatedCollection.fromApi(o, Grade.fromJson),
          equals(
            const PaginatedCollection<Grade>(
              items: [],
              totalItems: 2,
            ),
          ),
        );
      });

      test('when next page is not empty', () {
        const o = {
          'hydra:totalItems': 2,
          'hydra:member': [
            {'@id': '/grades/2', '@type': 'Grade', 'name': '5'},
            {'@id': '/grades/3', '@type': 'Grade', 'name': '5+'},
          ],
          'hydra:view': {'hydra:next': '/grades?page=2'},
        };
        expect(
          PaginatedCollection.fromApi(o, Grade.fromJson),
          equals(
            const PaginatedCollection<Grade>(
              items: [
                Grade(iri: '/grades/2', name: '5'),
                Grade(iri: '/grades/3', name: '5+'),
              ],
              totalItems: 2,
              nextPage: 2,
            ),
          ),
        );
      });

      test('when next page is not a string', () {
        const o = {
          'hydra:totalItems': 2,
          'hydra:member': [
            {'@id': '/grades/2', '@type': 'Grade', 'name': '5'},
            {'@id': '/grades/3', '@type': 'Grade', 'name': '5+'},
          ],
          'hydra:view': {'hydra:next': 1},
        };
        expect(
          PaginatedCollection.fromApi(o, Grade.fromJson),
          equals(
            const PaginatedCollection<Grade>(
              items: [
                Grade(iri: '/grades/2', name: '5'),
                Grade(iri: '/grades/3', name: '5+'),
              ],
              totalItems: 2,
            ),
          ),
        );
      });

      test('when next page is not a url', () {
        const o = {
          'hydra:totalItems': 2,
          'hydra:member': [
            {'@id': '/grades/2', '@type': 'Grade', 'name': '5'},
            {'@id': '/grades/3', '@type': 'Grade', 'name': '5+'},
          ],
          'hydra:view': {'hydra:next': ' '},
        };
        expect(
          PaginatedCollection.fromApi(o, Grade.fromJson),
          equals(
            const PaginatedCollection<Grade>(
              items: [
                Grade(iri: '/grades/2', name: '5'),
                Grade(iri: '/grades/3', name: '5+'),
              ],
              totalItems: 2,
            ),
          ),
        );
      });

      test('when next page has not a page query param', () {
        const o = {
          'hydra:totalItems': 2,
          'hydra:member': [
            {'@id': '/grades/2', '@type': 'Grade', 'name': '5'},
            {'@id': '/grades/3', '@type': 'Grade', 'name': '5+'},
          ],
          'hydra:view': {'hydra:next': '/foo'},
        };
        expect(
          PaginatedCollection.fromApi(o, Grade.fromJson),
          equals(
            const PaginatedCollection<Grade>(
              items: [
                Grade(iri: '/grades/2', name: '5'),
                Grade(iri: '/grades/3', name: '5+'),
              ],
              totalItems: 2,
            ),
          ),
        );
      });
    });
  });
}
