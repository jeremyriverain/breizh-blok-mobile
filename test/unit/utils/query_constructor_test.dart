import 'package:breizh_blok_mobile/utils/query_constructor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('QueryConstructor.stringify', () {
    test('return null if query params are null', () {
      final query = QueryConstructor.stringify();
      expect(query, null);
    });
    test('return foo=bar', () {
      final query = QueryConstructor.stringify(queryParams: {
        'foo': ['bar']
      });
      expect(query, 'foo=bar');
    });
    test('return foo=bar&baz=test', () {
      final query = QueryConstructor.stringify(queryParams: {
        'foo': ['bar'],
        'baz': ['test'],
      });
      expect(query, 'foo=bar&baz=test');
    });
    test('return foo=bar&baz[]aaa&baz[]=bbb', () {
      final query = QueryConstructor.stringify(queryParams: {
        'foo': ['bar'],
        'baz[]': ['aaa', 'bbb'],
      });
      expect(query, 'foo=bar&baz[]=aaa&baz[]=bbb');
    });

    test('encode query params correctly', () {
      final query = QueryConstructor.stringify(queryParams: {
        'grade.name[]': ['5', '5+']
      });
      expect(query, 'grade.name[]=5&grade.name[]=5%2B');
    });
  });
}
