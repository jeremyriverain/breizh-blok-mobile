//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/app_user_jsonld_boulder_feedback_read_context_one_of.dart';
import 'dart:core';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'app_user_jsonld_boulder_feedback_read_context.g.dart';

/// AppUserJsonldBoulderFeedbackReadContext
///
/// Properties:
/// * [atVocab]
/// * [hydra]
@BuiltValue()
abstract class AppUserJsonldBoulderFeedbackReadContext
    implements
        Built<
          AppUserJsonldBoulderFeedbackReadContext,
          AppUserJsonldBoulderFeedbackReadContextBuilder
        > {
  /// One Of [AppUserJsonldBoulderFeedbackReadContextOneOf], [String]
  OneOf get oneOf;

  AppUserJsonldBoulderFeedbackReadContext._();

  factory AppUserJsonldBoulderFeedbackReadContext([
    void updates(AppUserJsonldBoulderFeedbackReadContextBuilder b),
  ]) = _$AppUserJsonldBoulderFeedbackReadContext;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AppUserJsonldBoulderFeedbackReadContextBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AppUserJsonldBoulderFeedbackReadContext> get serializer =>
      _$AppUserJsonldBoulderFeedbackReadContextSerializer();
}

class _$AppUserJsonldBoulderFeedbackReadContextSerializer
    implements PrimitiveSerializer<AppUserJsonldBoulderFeedbackReadContext> {
  @override
  final Iterable<Type> types = const [
    AppUserJsonldBoulderFeedbackReadContext,
    _$AppUserJsonldBoulderFeedbackReadContext,
  ];

  @override
  final String wireName = r'AppUserJsonldBoulderFeedbackReadContext';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AppUserJsonldBoulderFeedbackReadContext object) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    AppUserJsonldBoulderFeedbackReadContext object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(
      oneOf.value,
      specifiedType: FullType(oneOf.valueType),
    )!;
  }

  @override
  AppUserJsonldBoulderFeedbackReadContext deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppUserJsonldBoulderFeedbackReadContextBuilder();
    Object? oneOfDataSrc;
    final targetType = const FullType(OneOf, [
      FullType(String),
      FullType(AppUserJsonldBoulderFeedbackReadContextOneOf),
    ]);
    oneOfDataSrc = serialized;
    result.oneOf =
        serializers.deserialize(oneOfDataSrc, specifiedType: targetType)
            as OneOf;
    return result.build();
  }
}

class AppUserJsonldBoulderFeedbackReadContextHydraEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'http://www.w3.org/ns/hydra/core#')
  static const AppUserJsonldBoulderFeedbackReadContextHydraEnum
  httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash =
      _$appUserJsonldBoulderFeedbackReadContextHydraEnum_httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash;

  static Serializer<AppUserJsonldBoulderFeedbackReadContextHydraEnum>
  get serializer =>
      _$appUserJsonldBoulderFeedbackReadContextHydraEnumSerializer;

  const AppUserJsonldBoulderFeedbackReadContextHydraEnum._(String name)
    : super(name);

  static BuiltSet<AppUserJsonldBoulderFeedbackReadContextHydraEnum>
  get values => _$appUserJsonldBoulderFeedbackReadContextHydraEnumValues;
  static AppUserJsonldBoulderFeedbackReadContextHydraEnum valueOf(
    String name,
  ) => _$appUserJsonldBoulderFeedbackReadContextHydraEnumValueOf(name);
}
