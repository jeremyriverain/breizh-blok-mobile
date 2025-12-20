//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/auth_zero_user_jsonld_auth_zero_user_read_context_one_of.dart';
import 'dart:core';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'auth_zero_user_jsonld_auth_zero_user_read_context.g.dart';

/// AuthZeroUserJsonldAuthZeroUserReadContext
///
/// Properties:
/// * [atVocab]
/// * [hydra]
@BuiltValue()
abstract class AuthZeroUserJsonldAuthZeroUserReadContext
    implements
        Built<
          AuthZeroUserJsonldAuthZeroUserReadContext,
          AuthZeroUserJsonldAuthZeroUserReadContextBuilder
        > {
  /// One Of [AuthZeroUserJsonldAuthZeroUserReadContextOneOf], [String]
  OneOf get oneOf;

  AuthZeroUserJsonldAuthZeroUserReadContext._();

  factory AuthZeroUserJsonldAuthZeroUserReadContext([
    void updates(AuthZeroUserJsonldAuthZeroUserReadContextBuilder b),
  ]) = _$AuthZeroUserJsonldAuthZeroUserReadContext;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthZeroUserJsonldAuthZeroUserReadContextBuilder b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthZeroUserJsonldAuthZeroUserReadContext> get serializer =>
      _$AuthZeroUserJsonldAuthZeroUserReadContextSerializer();
}

class _$AuthZeroUserJsonldAuthZeroUserReadContextSerializer
    implements PrimitiveSerializer<AuthZeroUserJsonldAuthZeroUserReadContext> {
  @override
  final Iterable<Type> types = const [
    AuthZeroUserJsonldAuthZeroUserReadContext,
    _$AuthZeroUserJsonldAuthZeroUserReadContext,
  ];

  @override
  final String wireName = r'AuthZeroUserJsonldAuthZeroUserReadContext';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthZeroUserJsonldAuthZeroUserReadContext object) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    AuthZeroUserJsonldAuthZeroUserReadContext object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(
      oneOf.value,
      specifiedType: FullType(oneOf.valueType),
    )!;
  }

  @override
  AuthZeroUserJsonldAuthZeroUserReadContext deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthZeroUserJsonldAuthZeroUserReadContextBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [
      FullType(String),
      FullType(AuthZeroUserJsonldAuthZeroUserReadContextOneOf),
    ]);
    oneOfDataSrc = serialized;
    result.oneOf =
        serializers.deserialize(oneOfDataSrc, specifiedType: targetType)
            as OneOf;
    return result.build();
  }
}

class AuthZeroUserJsonldAuthZeroUserReadContextHydraEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'http://www.w3.org/ns/hydra/core#')
  static const AuthZeroUserJsonldAuthZeroUserReadContextHydraEnum
  httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash =
      _$authZeroUserJsonldAuthZeroUserReadContextHydraEnum_httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash;

  static Serializer<AuthZeroUserJsonldAuthZeroUserReadContextHydraEnum>
  get serializer =>
      _$authZeroUserJsonldAuthZeroUserReadContextHydraEnumSerializer;

  const AuthZeroUserJsonldAuthZeroUserReadContextHydraEnum._(String name)
    : super(name);

  static BuiltSet<AuthZeroUserJsonldAuthZeroUserReadContextHydraEnum>
  get values => _$authZeroUserJsonldAuthZeroUserReadContextHydraEnumValues;
  static AuthZeroUserJsonldAuthZeroUserReadContextHydraEnum valueOf(
    String name,
  ) => _$authZeroUserJsonldAuthZeroUserReadContextHydraEnumValueOf(name);
}
