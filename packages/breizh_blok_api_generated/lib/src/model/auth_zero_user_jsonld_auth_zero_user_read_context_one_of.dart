//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_zero_user_jsonld_auth_zero_user_read_context_one_of.g.dart';

/// AuthZeroUserJsonldAuthZeroUserReadContextOneOf
///
/// Properties:
/// * [atVocab]
/// * [hydra]
@BuiltValue()
abstract class AuthZeroUserJsonldAuthZeroUserReadContextOneOf
    implements
        Built<
          AuthZeroUserJsonldAuthZeroUserReadContextOneOf,
          AuthZeroUserJsonldAuthZeroUserReadContextOneOfBuilder
        > {
  @BuiltValueField(wireName: r'@vocab')
  String get atVocab;

  @BuiltValueField(wireName: r'hydra')
  AuthZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnum get hydra;
  // enum hydraEnum {  http://www.w3.org/ns/hydra/core#,  };

  AuthZeroUserJsonldAuthZeroUserReadContextOneOf._();

  factory AuthZeroUserJsonldAuthZeroUserReadContextOneOf([
    void updates(AuthZeroUserJsonldAuthZeroUserReadContextOneOfBuilder b),
  ]) = _$AuthZeroUserJsonldAuthZeroUserReadContextOneOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(
    AuthZeroUserJsonldAuthZeroUserReadContextOneOfBuilder b,
  ) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthZeroUserJsonldAuthZeroUserReadContextOneOf>
  get serializer =>
      _$AuthZeroUserJsonldAuthZeroUserReadContextOneOfSerializer();
}

class _$AuthZeroUserJsonldAuthZeroUserReadContextOneOfSerializer
    implements
        PrimitiveSerializer<AuthZeroUserJsonldAuthZeroUserReadContextOneOf> {
  @override
  final Iterable<Type> types = const [
    AuthZeroUserJsonldAuthZeroUserReadContextOneOf,
    _$AuthZeroUserJsonldAuthZeroUserReadContextOneOf,
  ];

  @override
  final String wireName = r'AuthZeroUserJsonldAuthZeroUserReadContextOneOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthZeroUserJsonldAuthZeroUserReadContextOneOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'@vocab';
    yield serializers.serialize(
      object.atVocab,
      specifiedType: const FullType(String),
    );
    yield r'hydra';
    yield serializers.serialize(
      object.hydra,
      specifiedType: const FullType(
        AuthZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnum,
      ),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AuthZeroUserJsonldAuthZeroUserReadContextOneOf object, {
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
    required AuthZeroUserJsonldAuthZeroUserReadContextOneOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'@vocab':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.atVocab = valueDes;
          break;
        case r'hydra':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      AuthZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnum,
                    ),
                  )
                  as AuthZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnum;
          result.hydra = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AuthZeroUserJsonldAuthZeroUserReadContextOneOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthZeroUserJsonldAuthZeroUserReadContextOneOfBuilder();
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

class AuthZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnum
    extends EnumClass {
  @BuiltValueEnumConst(wireName: r'http://www.w3.org/ns/hydra/core#')
  static const AuthZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnum
  httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash =
      _$authZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnum_httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash;

  static Serializer<AuthZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnum>
  get serializer =>
      _$authZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnumSerializer;

  const AuthZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnum._(String name)
    : super(name);

  static BuiltSet<AuthZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnum>
  get values => _$authZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnumValues;
  static AuthZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnum valueOf(
    String name,
  ) => _$authZeroUserJsonldAuthZeroUserReadContextOneOfHydraEnumValueOf(name);
}
