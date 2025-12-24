import 'package:breizh_blok_mobile/domain/entities/user/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User', () {
    test('isAmbassador', () {
      expect(const User().isAmbassador, isFalse);
      expect(const User(roles: ['ROLE_USER']).isAmbassador, isFalse);
      expect(const User(roles: ['ROLE_AMBASSADOR']).isAmbassador, isTrue);
    });
  });
}
