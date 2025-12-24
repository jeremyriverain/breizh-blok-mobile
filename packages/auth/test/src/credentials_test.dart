import 'package:breizh_blok_auth/src/credentials.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Credentials', () {
    test('equality', () {
      expect(
        const Credentials(accessToken: 'foo', id: 'bar') ==
            const Credentials(accessToken: 'foo', id: 'bar'),
        isTrue,
      );
      expect(
        const Credentials(accessToken: 'foo', id: 'bar') ==
            const Credentials(accessToken: 'bar', id: 'bar'),
        isFalse,
      );
    });
  });
}
