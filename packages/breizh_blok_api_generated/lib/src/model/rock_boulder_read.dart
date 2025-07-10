//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/boulder_area_boulder_read.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rock_boulder_read.g.dart';

///
///
/// Properties:
/// * [location] -
/// * [boulderArea]
@BuiltValue()
abstract class RockBoulderRead
    implements Built<RockBoulderRead, RockBoulderReadBuilder> {
  ///
  @BuiltValueField(wireName: r'location')
  JsonObject get location;

  @BuiltValueField(wireName: r'boulderArea')
  BoulderAreaBoulderRead get boulderArea;

  RockBoulderRead._();

  factory RockBoulderRead([void updates(RockBoulderReadBuilder b)]) =
      _$RockBoulderRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RockBoulderReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RockBoulderRead> get serializer =>
      _$RockBoulderReadSerializer();
}

class _$RockBoulderReadSerializer
    implements PrimitiveSerializer<RockBoulderRead> {
  @override
  final Iterable<Type> types = const [RockBoulderRead, _$RockBoulderRead];

  @override
  final String wireName = r'RockBoulderRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RockBoulderRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'location';
    yield serializers.serialize(
      object.location,
      specifiedType: const FullType(JsonObject),
    );
    yield r'boulderArea';
    yield serializers.serialize(
      object.boulderArea,
      specifiedType: const FullType(BoulderAreaBoulderRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RockBoulderRead object, {
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
    required RockBoulderReadBuilder result,
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
        case r'boulderArea':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BoulderAreaBoulderRead),
          ) as BoulderAreaBoulderRead;
          result.boulderArea.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RockBoulderRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RockBoulderReadBuilder();
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
