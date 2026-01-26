//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_auth_zero_user_read.g.dart';

/// UserAuthZeroUserRead
///
/// Properties:
/// * [roles]
@BuiltValue()
abstract class UserAuthZeroUserRead
    implements Built<UserAuthZeroUserRead, UserAuthZeroUserReadBuilder> {
  @BuiltValueField(wireName: r'roles')
  BuiltList<String>? get roles;

  UserAuthZeroUserRead._();

  factory UserAuthZeroUserRead([void updates(UserAuthZeroUserReadBuilder b)]) =
      _$UserAuthZeroUserRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserAuthZeroUserReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserAuthZeroUserRead> get serializer =>
      _$UserAuthZeroUserReadSerializer();
}

class _$UserAuthZeroUserReadSerializer
    implements PrimitiveSerializer<UserAuthZeroUserRead> {
  @override
  final Iterable<Type> types = const [
    UserAuthZeroUserRead,
    _$UserAuthZeroUserRead,
  ];

  @override
  final String wireName = r'UserAuthZeroUserRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserAuthZeroUserRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.roles != null) {
      yield r'roles';
      yield serializers.serialize(
        object.roles,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserAuthZeroUserRead object, {
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
    required UserAuthZeroUserReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'roles':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(String),
                    ]),
                  )
                  as BuiltList<String>;
          result.roles.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserAuthZeroUserRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserAuthZeroUserReadBuilder();
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
