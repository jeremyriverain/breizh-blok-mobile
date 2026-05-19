import 'package:breizh_blok_mobile/data/data_sources/remote/model/paginated_collection.dart';
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
  });
}
