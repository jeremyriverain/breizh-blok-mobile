//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'hydra_item_base_schema_context_one_of.g.dart';

/// HydraItemBaseSchemaContextOneOf
///
/// Properties:
/// * [atVocab]
/// * [hydra]
@BuiltValue()
abstract class HydraItemBaseSchemaContextOneOf
    implements
        Built<
          HydraItemBaseSchemaContextOneOf,
          HydraItemBaseSchemaContextOneOfBuilder
        > {
  @BuiltValueField(wireName: r'@vocab')
  String get atVocab;

  @BuiltValueField(wireName: r'hydra')
  HydraItemBaseSchemaContextOneOfHydraEnum get hydra;
  // enum hydraEnum {  http://www.w3.org/ns/hydra/core#,  };

  HydraItemBaseSchemaContextOneOf._();

  factory HydraItemBaseSchemaContextOneOf([
    void updates(HydraItemBaseSchemaContextOneOfBuilder b),
  ]) = _$HydraItemBaseSchemaContextOneOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HydraItemBaseSchemaContextOneOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HydraItemBaseSchemaContextOneOf> get serializer =>
      _$HydraItemBaseSchemaContextOneOfSerializer();
}

class _$HydraItemBaseSchemaContextOneOfSerializer
    implements PrimitiveSerializer<HydraItemBaseSchemaContextOneOf> {
  @override
  final Iterable<Type> types = const [
    HydraItemBaseSchemaContextOneOf,
    _$HydraItemBaseSchemaContextOneOf,
  ];

  @override
  final String wireName = r'HydraItemBaseSchemaContextOneOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HydraItemBaseSchemaContextOneOf object, {
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
      specifiedType: const FullType(HydraItemBaseSchemaContextOneOfHydraEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    HydraItemBaseSchemaContextOneOf object, {
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
    required HydraItemBaseSchemaContextOneOfBuilder result,
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
                      HydraItemBaseSchemaContextOneOfHydraEnum,
                    ),
                  )
                  as HydraItemBaseSchemaContextOneOfHydraEnum;
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
  HydraItemBaseSchemaContextOneOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HydraItemBaseSchemaContextOneOfBuilder();
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

class HydraItemBaseSchemaContextOneOfHydraEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'http://www.w3.org/ns/hydra/core#')
  static const HydraItemBaseSchemaContextOneOfHydraEnum
  httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash =
      _$hydraItemBaseSchemaContextOneOfHydraEnum_httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash;

  static Serializer<HydraItemBaseSchemaContextOneOfHydraEnum> get serializer =>
      _$hydraItemBaseSchemaContextOneOfHydraEnumSerializer;

  const HydraItemBaseSchemaContextOneOfHydraEnum._(String name) : super(name);

  static BuiltSet<HydraItemBaseSchemaContextOneOfHydraEnum> get values =>
      _$hydraItemBaseSchemaContextOneOfHydraEnumValues;
  static HydraItemBaseSchemaContextOneOfHydraEnum valueOf(String name) =>
      _$hydraItemBaseSchemaContextOneOfHydraEnumValueOf(name);
}
