//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'hydra_item_base_schema.g.dart';

/// HydraItemBaseSchema
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
@BuiltValue(instantiable: false)
abstract class HydraItemBaseSchema {
  @BuiltValueField(wireName: r'@context')
  HydraItemBaseSchemaContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String get atId;

  @BuiltValueField(wireName: r'@type')
  String get atType;

  @BuiltValueSerializer(custom: true)
  static Serializer<HydraItemBaseSchema> get serializer =>
      _$HydraItemBaseSchemaSerializer();
}

class _$HydraItemBaseSchemaSerializer
    implements PrimitiveSerializer<HydraItemBaseSchema> {
  @override
  final Iterable<Type> types = const [HydraItemBaseSchema];

  @override
  final String wireName = r'HydraItemBaseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HydraItemBaseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(HydraItemBaseSchemaContext),
      );
    }
    yield r'@id';
    yield serializers.serialize(
      object.atId,
      specifiedType: const FullType(String),
    );
    yield r'@type';
    yield serializers.serialize(
      object.atType,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    HydraItemBaseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(
      serializers,
      object,
      specifiedType: specifiedType,
    ).toList();
  }

  @override
  HydraItemBaseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(
          serialized,
          specifiedType: FullType($HydraItemBaseSchema),
        )
        as $HydraItemBaseSchema;
  }
}

/// a concrete implementation of [HydraItemBaseSchema], since [HydraItemBaseSchema] is not instantiable
@BuiltValue(instantiable: true)
abstract class $HydraItemBaseSchema
    implements
        HydraItemBaseSchema,
        Built<$HydraItemBaseSchema, $HydraItemBaseSchemaBuilder> {
  $HydraItemBaseSchema._();

  factory $HydraItemBaseSchema([
    void Function($HydraItemBaseSchemaBuilder)? updates,
  ]) = _$$HydraItemBaseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($HydraItemBaseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$HydraItemBaseSchema> get serializer =>
      _$$HydraItemBaseSchemaSerializer();
}

class _$$HydraItemBaseSchemaSerializer
    implements PrimitiveSerializer<$HydraItemBaseSchema> {
  @override
  final Iterable<Type> types = const [
    $HydraItemBaseSchema,
    _$$HydraItemBaseSchema,
  ];

  @override
  final String wireName = r'$HydraItemBaseSchema';

  @override
  Object serialize(
    Serializers serializers,
    $HydraItemBaseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(
      object,
      specifiedType: FullType(HydraItemBaseSchema),
    )!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HydraItemBaseSchemaBuilder result,
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
                    specifiedType: const FullType(HydraItemBaseSchemaContext),
                  )
                  as HydraItemBaseSchemaContext;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $HydraItemBaseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $HydraItemBaseSchemaBuilder();
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
