//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/user_auth_zero_user_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_zero_user_auth_zero_user_read.g.dart';

///
///
/// Properties:
/// * [user]
@BuiltValue()
abstract class AuthZeroUserAuthZeroUserRead
    implements
        Built<
          AuthZeroUserAuthZeroUserRead,
          AuthZeroUserAuthZeroUserReadBuilder
        > {
  @BuiltValueField(wireName: r'user')
  UserAuthZeroUserRead? get user;

  AuthZeroUserAuthZeroUserRead._();

  factory AuthZeroUserAuthZeroUserRead([
    void updates(AuthZeroUserAuthZeroUserReadBuilder b),
  ]) = _$AuthZeroUserAuthZeroUserRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthZeroUserAuthZeroUserReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthZeroUserAuthZeroUserRead> get serializer =>
      _$AuthZeroUserAuthZeroUserReadSerializer();
}

class _$AuthZeroUserAuthZeroUserReadSerializer
    implements PrimitiveSerializer<AuthZeroUserAuthZeroUserRead> {
  @override
  final Iterable<Type> types = const [
    AuthZeroUserAuthZeroUserRead,
    _$AuthZeroUserAuthZeroUserRead,
  ];

  @override
  final String wireName = r'AuthZeroUserAuthZeroUserRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthZeroUserAuthZeroUserRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.user != null) {
      yield r'user';
      yield serializers.serialize(
        object.user,
        specifiedType: const FullType.nullable(UserAuthZeroUserRead),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AuthZeroUserAuthZeroUserRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(
      serializers,
      object,
      specifiedType: specifiedType,
    ).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuthZeroUserAuthZeroUserReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(
                      UserAuthZeroUserRead,
                    ),
                  )
                  as UserAuthZeroUserRead?;
          if (valueDes == null) continue;
          result.user.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AuthZeroUserAuthZeroUserRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthZeroUserAuthZeroUserReadBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
