//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/auth_zero_user_jsonld_auth_zero_user_read_context.dart';
import 'package:breizh_blok_api_generated/src/model/user_jsonld_auth_zero_user_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_zero_user_jsonld_auth_zero_user_read.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [user]
@BuiltValue()
abstract class AuthZeroUserJsonldAuthZeroUserRead
    implements
        Built<
          AuthZeroUserJsonldAuthZeroUserRead,
          AuthZeroUserJsonldAuthZeroUserReadBuilder
        > {
  @BuiltValueField(wireName: r'@context')
  AuthZeroUserJsonldAuthZeroUserReadContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'user')
  UserJsonldAuthZeroUserRead? get user;

  AuthZeroUserJsonldAuthZeroUserRead._();

  factory AuthZeroUserJsonldAuthZeroUserRead([
    void updates(AuthZeroUserJsonldAuthZeroUserReadBuilder b),
  ]) = _$AuthZeroUserJsonldAuthZeroUserRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthZeroUserJsonldAuthZeroUserReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthZeroUserJsonldAuthZeroUserRead> get serializer =>
      _$AuthZeroUserJsonldAuthZeroUserReadSerializer();
}

class _$AuthZeroUserJsonldAuthZeroUserReadSerializer
    implements PrimitiveSerializer<AuthZeroUserJsonldAuthZeroUserRead> {
  @override
  final Iterable<Type> types = const [
    AuthZeroUserJsonldAuthZeroUserRead,
    _$AuthZeroUserJsonldAuthZeroUserRead,
  ];

  @override
  final String wireName = r'AuthZeroUserJsonldAuthZeroUserRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthZeroUserJsonldAuthZeroUserRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(
          AuthZeroUserJsonldAuthZeroUserReadContext,
        ),
      );
    }
    if (object.atId != null) {
      yield r'@id';
      yield serializers.serialize(
        object.atId,
        specifiedType: const FullType(String),
      );
    }
    if (object.atType != null) {
      yield r'@type';
      yield serializers.serialize(
        object.atType,
        specifiedType: const FullType(String),
      );
    }
    if (object.user != null) {
      yield r'user';
      yield serializers.serialize(
        object.user,
        specifiedType: const FullType.nullable(UserJsonldAuthZeroUserRead),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AuthZeroUserJsonldAuthZeroUserRead object, {
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
    required AuthZeroUserJsonldAuthZeroUserReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'@context':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      AuthZeroUserJsonldAuthZeroUserReadContext,
                    ),
                  )
                  as AuthZeroUserJsonldAuthZeroUserReadContext;
          result.atContext.replace(valueDes);
          break;
        case r'@id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.atId = valueDes;
          break;
        case r'@type':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.atType = valueDes;
          break;
        case r'user':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(
                      UserJsonldAuthZeroUserRead,
                    ),
                  )
                  as UserJsonldAuthZeroUserRead?;
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
  AuthZeroUserJsonldAuthZeroUserRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthZeroUserJsonldAuthZeroUserReadBuilder();
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
