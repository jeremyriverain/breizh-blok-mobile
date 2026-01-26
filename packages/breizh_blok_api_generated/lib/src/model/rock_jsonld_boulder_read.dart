//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/boulder_area_jsonld_boulder_read.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema_context.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rock_jsonld_boulder_read.g.dart';

/// RockJsonldBoulderRead
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [location]
/// * [boulderArea]
@BuiltValue()
abstract class RockJsonldBoulderRead
    implements
        HydraItemBaseSchema,
        Built<RockJsonldBoulderRead, RockJsonldBoulderReadBuilder> {
  @BuiltValueField(wireName: r'boulderArea')
  BoulderAreaJsonldBoulderRead get boulderArea;

  @BuiltValueField(wireName: r'location')
  JsonObject get location;

  RockJsonldBoulderRead._();

  factory RockJsonldBoulderRead([
    void updates(RockJsonldBoulderReadBuilder b),
  ]) = _$RockJsonldBoulderRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RockJsonldBoulderReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RockJsonldBoulderRead> get serializer =>
      _$RockJsonldBoulderReadSerializer();
}

class _$RockJsonldBoulderReadSerializer
    implements PrimitiveSerializer<RockJsonldBoulderRead> {
  @override
  final Iterable<Type> types = const [
    RockJsonldBoulderRead,
    _$RockJsonldBoulderRead,
  ];

  @override
  final String wireName = r'RockJsonldBoulderRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RockJsonldBoulderRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'boulderArea';
    yield serializers.serialize(
      object.boulderArea,
      specifiedType: const FullType(BoulderAreaJsonldBoulderRead),
    );
    yield r'location';
    yield serializers.serialize(
      object.location,
      specifiedType: const FullType(JsonObject),
    );
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
    RockJsonldBoulderRead object, {
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
    required RockJsonldBoulderReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'boulderArea':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BoulderAreaJsonldBoulderRead),
                  )
                  as BoulderAreaJsonldBoulderRead;
          result.boulderArea.replace(valueDes);
          break;
        case r'location':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(JsonObject),
                  )
                  as JsonObject;
          result.location = valueDes;
          break;
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
  RockJsonldBoulderRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RockJsonldBoulderReadBuilder();
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
