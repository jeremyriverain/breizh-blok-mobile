//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/boulder_rock_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rock_rock_read.g.dart';

///
///
/// Properties:
/// * [location] -
/// * [boulders]
/// * [pictures]
@BuiltValue()
abstract class RockRockRead
    implements Built<RockRockRead, RockRockReadBuilder> {
  ///
  @BuiltValueField(wireName: r'location')
  JsonObject get location;

  @BuiltValueField(wireName: r'boulders')
  BuiltList<BoulderRockRead>? get boulders;

  @BuiltValueField(wireName: r'pictures')
  BuiltList<String>? get pictures;

  RockRockRead._();

  factory RockRockRead([void updates(RockRockReadBuilder b)]) = _$RockRockRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RockRockReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RockRockRead> get serializer => _$RockRockReadSerializer();
}

class _$RockRockReadSerializer implements PrimitiveSerializer<RockRockRead> {
  @override
  final Iterable<Type> types = const [RockRockRead, _$RockRockRead];

  @override
  final String wireName = r'RockRockRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RockRockRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'location';
    yield serializers.serialize(
      object.location,
      specifiedType: const FullType(JsonObject),
    );
    if (object.boulders != null) {
      yield r'boulders';
      yield serializers.serialize(
        object.boulders,
        specifiedType: const FullType(BuiltList, [FullType(BoulderRockRead)]),
      );
    }
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
    RockRockRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RockRockReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'location':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.location = valueDes;
          break;
        case r'boulders':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(BoulderRockRead)]),
          ) as BuiltList<BoulderRockRead>;
          result.boulders.replace(valueDes);
          break;
        case r'pictures':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
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
  RockRockRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RockRockReadBuilder();
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
