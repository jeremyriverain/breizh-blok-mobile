//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_jsonld_boulder_item_get_context_one_of.g.dart';

/// BoulderJsonldBoulderItemGetContextOneOf
///
/// Properties:
/// * [atVocab]
/// * [hydra]
@BuiltValue()
abstract class BoulderJsonldBoulderItemGetContextOneOf
    implements
        Built<
          BoulderJsonldBoulderItemGetContextOneOf,
          BoulderJsonldBoulderItemGetContextOneOfBuilder
        > {
  @BuiltValueField(wireName: r'@vocab')
  String get atVocab;

  @BuiltValueField(wireName: r'hydra')
  BoulderJsonldBoulderItemGetContextOneOfHydraEnum get hydra;
  // enum hydraEnum {  http://www.w3.org/ns/hydra/core#,  };

  BoulderJsonldBoulderItemGetContextOneOf._();

  factory BoulderJsonldBoulderItemGetContextOneOf([
    void updates(BoulderJsonldBoulderItemGetContextOneOfBuilder b),
  ]) = _$BoulderJsonldBoulderItemGetContextOneOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderJsonldBoulderItemGetContextOneOfBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderJsonldBoulderItemGetContextOneOf> get serializer =>
      _$BoulderJsonldBoulderItemGetContextOneOfSerializer();
}

class _$BoulderJsonldBoulderItemGetContextOneOfSerializer
    implements PrimitiveSerializer<BoulderJsonldBoulderItemGetContextOneOf> {
  @override
  final Iterable<Type> types = const [
    BoulderJsonldBoulderItemGetContextOneOf,
    _$BoulderJsonldBoulderItemGetContextOneOf,
  ];

  @override
  final String wireName = r'BoulderJsonldBoulderItemGetContextOneOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderJsonldBoulderItemGetContextOneOf object, {
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
        BoulderJsonldBoulderItemGetContextOneOfHydraEnum,
      ),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderJsonldBoulderItemGetContextOneOf object, {
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
    required BoulderJsonldBoulderItemGetContextOneOfBuilder result,
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
                      BoulderJsonldBoulderItemGetContextOneOfHydraEnum,
                    ),
                  )
                  as BoulderJsonldBoulderItemGetContextOneOfHydraEnum;
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
  BoulderJsonldBoulderItemGetContextOneOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderJsonldBoulderItemGetContextOneOfBuilder();
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

class BoulderJsonldBoulderItemGetContextOneOfHydraEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'http://www.w3.org/ns/hydra/core#')
  static const BoulderJsonldBoulderItemGetContextOneOfHydraEnum
  httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash =
      _$boulderJsonldBoulderItemGetContextOneOfHydraEnum_httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash;

  static Serializer<BoulderJsonldBoulderItemGetContextOneOfHydraEnum>
  get serializer =>
      _$boulderJsonldBoulderItemGetContextOneOfHydraEnumSerializer;

  const BoulderJsonldBoulderItemGetContextOneOfHydraEnum._(String name)
    : super(name);

  static BuiltSet<BoulderJsonldBoulderItemGetContextOneOfHydraEnum>
  get values => _$boulderJsonldBoulderItemGetContextOneOfHydraEnumValues;
  static BoulderJsonldBoulderItemGetContextOneOfHydraEnum valueOf(
    String name,
  ) => _$boulderJsonldBoulderItemGetContextOneOfHydraEnumValueOf(name);
}
