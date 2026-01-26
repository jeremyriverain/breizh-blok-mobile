//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_jsonld_auth_zero_user_read.g.dart';

/// UserJsonldAuthZeroUserRead
///
/// Properties:
/// * [roles]
@BuiltValue()
abstract class UserJsonldAuthZeroUserRead
    implements
        Built<UserJsonldAuthZeroUserRead, UserJsonldAuthZeroUserReadBuilder> {
  @BuiltValueField(wireName: r'roles')
  BuiltList<String>? get roles;

  UserJsonldAuthZeroUserRead._();

  factory UserJsonldAuthZeroUserRead([
    void updates(UserJsonldAuthZeroUserReadBuilder b),
  ]) = _$UserJsonldAuthZeroUserRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserJsonldAuthZeroUserReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserJsonldAuthZeroUserRead> get serializer =>
      _$UserJsonldAuthZeroUserReadSerializer();
}

class _$UserJsonldAuthZeroUserReadSerializer
    implements PrimitiveSerializer<UserJsonldAuthZeroUserRead> {
  @override
  final Iterable<Type> types = const [
    UserJsonldAuthZeroUserRead,
    _$UserJsonldAuthZeroUserRead,
  ];

  @override
  final String wireName = r'UserJsonldAuthZeroUserRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserJsonldAuthZeroUserRead object, {
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
    UserJsonldAuthZeroUserRead object, {
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
    required UserJsonldAuthZeroUserReadBuilder result,
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
  UserJsonldAuthZeroUserRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserJsonldAuthZeroUserReadBuilder();
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
