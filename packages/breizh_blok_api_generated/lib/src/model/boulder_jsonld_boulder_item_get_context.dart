//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/boulder_jsonld_boulder_item_get_context_one_of.dart';
import 'package:built_collection/built_collection.dart';
import 'dart:core';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'boulder_jsonld_boulder_item_get_context.g.dart';

/// BoulderJsonldBoulderItemGetContext
///
/// Properties:
/// * [atVocab]
/// * [hydra]
@BuiltValue()
abstract class BoulderJsonldBoulderItemGetContext
    implements
        Built<
          BoulderJsonldBoulderItemGetContext,
          BoulderJsonldBoulderItemGetContextBuilder
        > {
  /// One Of [BoulderJsonldBoulderItemGetContextOneOf], [String]
  OneOf get oneOf;

  BoulderJsonldBoulderItemGetContext._();

  factory BoulderJsonldBoulderItemGetContext([
    void updates(BoulderJsonldBoulderItemGetContextBuilder b),
  ]) = _$BoulderJsonldBoulderItemGetContext;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderJsonldBoulderItemGetContextBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderJsonldBoulderItemGetContext> get serializer =>
      _$BoulderJsonldBoulderItemGetContextSerializer();
}

class _$BoulderJsonldBoulderItemGetContextSerializer
    implements PrimitiveSerializer<BoulderJsonldBoulderItemGetContext> {
  @override
  final Iterable<Type> types = const [
    BoulderJsonldBoulderItemGetContext,
    _$BoulderJsonldBoulderItemGetContext,
  ];

  @override
  final String wireName = r'BoulderJsonldBoulderItemGetContext';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderJsonldBoulderItemGetContext object) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    BoulderJsonldBoulderItemGetContext object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(
      oneOf.value,
      specifiedType: FullType(oneOf.valueType),
    )!;
  }

  @override
  BoulderJsonldBoulderItemGetContext deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderJsonldBoulderItemGetContextBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [
      FullType(String),
      FullType(BoulderJsonldBoulderItemGetContextOneOf),
    ]);
    oneOfDataSrc = serialized;
    result.oneOf =
        serializers.deserialize(oneOfDataSrc, specifiedType: targetType)
            as OneOf;
    return result.build();
  }
}

class BoulderJsonldBoulderItemGetContextHydraEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'http://www.w3.org/ns/hydra/core#')
  static const BoulderJsonldBoulderItemGetContextHydraEnum
  httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash =
      _$boulderJsonldBoulderItemGetContextHydraEnum_httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash;

  static Serializer<BoulderJsonldBoulderItemGetContextHydraEnum>
  get serializer => _$boulderJsonldBoulderItemGetContextHydraEnumSerializer;

  const BoulderJsonldBoulderItemGetContextHydraEnum._(String name)
    : super(name);

  static BuiltSet<BoulderJsonldBoulderItemGetContextHydraEnum> get values =>
      _$boulderJsonldBoulderItemGetContextHydraEnumValues;
  static BoulderJsonldBoulderItemGetContextHydraEnum valueOf(String name) =>
      _$boulderJsonldBoulderItemGetContextHydraEnumValueOf(name);
}
