import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @Default(<String>[]) List<String> roles,
  }) = _User;

  const User._();

  bool get isAmbassador =>
      roles.isNotEmpty && roles.contains('ROLE_AMBASSADOR');
}
