import 'package:breizh_blok_mobile/query_param_factory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('QueryConstructor.stringify', () {
    test('return null if query params are null', () {
      final query = QueryParamFactory.stringify();
      expect(query, null);
    });
    test('return foo=bar', () {
      final query = QueryParamFactory.stringify(
        queryParams: {
          'foo': ['bar'],
        },
      );
      expect(query, 'foo=bar');
    });
    test('return foo=bar&baz=test', () {
      final query = QueryParamFactory.stringify(
        queryParams: {
          'foo': ['bar'],
          'baz': ['test'],
        },
      );
      expect(query, 'baz=test&foo=bar');
    });
    test('return foo=bar&baz[]aaa&baz[]=bbb', () {
      final query = QueryParamFactory.stringify(
        queryParams: {
          'foo': ['bar'],
          'baz[]': ['aaa', 'bbb'],
        },
      );
      expect(query, 'baz[]=aaa&baz[]=bbb&foo=bar');
    });

    test('encode query params correctly', () {
      final query = QueryParamFactory.stringify(
        queryParams: {
          'grade.name[]': ['5', '5+'],
        },
      );
      expect(query, 'grade.name[]=5&grade.name[]=5%2B');
    });
  });
}
