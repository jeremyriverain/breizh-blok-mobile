//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/boulder_jsonld_rock_read.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema.dart';
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema_context.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rock_jsonld_rock_read.g.dart';

/// RockJsonldRockRead
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [location]
/// * [boulders]
/// * [pictures]
@BuiltValue()
abstract class RockJsonldRockRead
    implements
        HydraItemBaseSchema,
        Built<RockJsonldRockRead, RockJsonldRockReadBuilder> {
  @BuiltValueField(wireName: r'boulders')
  BuiltList<BoulderJsonldRockRead>? get boulders;

  @BuiltValueField(wireName: r'location')
  JsonObject get location;

  @BuiltValueField(wireName: r'pictures')
  BuiltList<String>? get pictures;

  RockJsonldRockRead._();

  factory RockJsonldRockRead([void updates(RockJsonldRockReadBuilder b)]) =
      _$RockJsonldRockRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RockJsonldRockReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RockJsonldRockRead> get serializer =>
      _$RockJsonldRockReadSerializer();
}

class _$RockJsonldRockReadSerializer
    implements PrimitiveSerializer<RockJsonldRockRead> {
  @override
  final Iterable<Type> types = const [RockJsonldRockRead, _$RockJsonldRockRead];

  @override
  final String wireName = r'RockJsonldRockRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RockJsonldRockRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.boulders != null) {
      yield r'boulders';
      yield serializers.serialize(
        object.boulders,
        specifiedType: const FullType(BuiltList, [
          FullType(BoulderJsonldRockRead),
        ]),
      );
    }
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
    if (object.pictures != null) {
      yield r'pictures';
      yield serializers.serialize(
        object.pictures,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RockJsonldRockRead object, {
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
    required RockJsonldRockReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'boulders':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(BoulderJsonldRockRead),
                    ]),
                  )
                  as BuiltList<BoulderJsonldRockRead>;
          result.boulders.replace(valueDes);
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
        case r'pictures':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(String),
                    ]),
                  )
                  as BuiltList<String>;
          result.pictures.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RockJsonldRockRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RockJsonldRockReadBuilder();
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
