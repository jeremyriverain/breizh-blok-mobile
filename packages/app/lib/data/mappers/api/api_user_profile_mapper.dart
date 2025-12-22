import 'package:breizh_blok_api_generated/breizh_blok_api_generated.dart';
import 'package:breizh_blok_mobile/domain/entities/user/user.dart';

class ApiUserProfileMapper {
  const ApiUserProfileMapper();

  User toDomainFrom(UserJsonldAuthZeroUserRead from) {
    final roles = from.roles;
    return User(
      roles: [
        if (roles != null)
          for (final role in roles) role,
      ],
    );
  }
}
