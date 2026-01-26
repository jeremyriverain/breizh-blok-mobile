//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema_context_one_of.dart';
import 'dart:core';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'hydra_item_base_schema_context.g.dart';

/// HydraItemBaseSchemaContext
///
/// Properties:
/// * [atVocab]
/// * [hydra]
@BuiltValue()
abstract class HydraItemBaseSchemaContext
    implements
        Built<HydraItemBaseSchemaContext, HydraItemBaseSchemaContextBuilder> {
  /// One Of [HydraItemBaseSchemaContextOneOf], [String]
  OneOf get oneOf;

  HydraItemBaseSchemaContext._();

  factory HydraItemBaseSchemaContext([
    void updates(HydraItemBaseSchemaContextBuilder b),
  ]) = _$HydraItemBaseSchemaContext;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HydraItemBaseSchemaContextBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HydraItemBaseSchemaContext> get serializer =>
      _$HydraItemBaseSchemaContextSerializer();
}

class _$HydraItemBaseSchemaContextSerializer
    implements PrimitiveSerializer<HydraItemBaseSchemaContext> {
  @override
  final Iterable<Type> types = const [
    HydraItemBaseSchemaContext,
    _$HydraItemBaseSchemaContext,
  ];

  @override
  final String wireName = r'HydraItemBaseSchemaContext';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HydraItemBaseSchemaContext object) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    HydraItemBaseSchemaContext object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(
      oneOf.value,
      specifiedType: FullType(oneOf.valueType),
    )!;
  }

  @override
  HydraItemBaseSchemaContext deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HydraItemBaseSchemaContextBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [
      FullType(String),
      FullType(HydraItemBaseSchemaContextOneOf),
    ]);
    oneOfDataSrc = serialized;
    result.oneOf =
        serializers.deserialize(oneOfDataSrc, specifiedType: targetType)
            as OneOf;
    return result.build();
  }
}

class HydraItemBaseSchemaContextHydraEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'http://www.w3.org/ns/hydra/core#')
  static const HydraItemBaseSchemaContextHydraEnum
  httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash =
      _$hydraItemBaseSchemaContextHydraEnum_httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash;

  static Serializer<HydraItemBaseSchemaContextHydraEnum> get serializer =>
      _$hydraItemBaseSchemaContextHydraEnumSerializer;

  const HydraItemBaseSchemaContextHydraEnum._(String name) : super(name);

  static BuiltSet<HydraItemBaseSchemaContextHydraEnum> get values =>
      _$hydraItemBaseSchemaContextHydraEnumValues;
  static HydraItemBaseSchemaContextHydraEnum valueOf(String name) =>
      _$hydraItemBaseSchemaContextHydraEnumValueOf(name);
}
