import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

enum RoleUser { contributor, admin, superAdmin }

@freezed
abstract class User with _$User {
  const factory User({
    @Default(<RoleUser>[]) List<RoleUser> roles,
  }) = _User;

  const User._();
}
