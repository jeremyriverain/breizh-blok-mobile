import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart';
import 'package:breizh_blok_mobile/data/mappers/api/api_user_profile_mapper.dart';
import 'package:breizh_blok_mobile/domain/entities/user/user.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApiUserProfileMapper', () {
    group('toDomainFromUserRead', () {
      test('return User correctly', () {
        expect(
          const ApiUserProfileMapper().toDomainFromUserRead(
            UserJsonldAuthZeroUserRead((builder) {
              builder.roles = ListBuilder<String>([]);
            }),
          ),
          const User(),
        );

        expect(
          const ApiUserProfileMapper().toDomainFromUserRead(
            UserJsonldAuthZeroUserRead((builder) {
              builder.roles = ListBuilder<String>(['ROLE_FOO']);
            }),
          ),
          const User(roles: ['ROLE_FOO']),
        );
      });
    });
  });
}
