//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'geo_point_jsonld_boulder_feedback_write.g.dart';

///
///
/// Properties:
/// * [latitude]
/// * [longitude]
@BuiltValue()
abstract class GeoPointJsonldBoulderFeedbackWrite
    implements
        Built<
          GeoPointJsonldBoulderFeedbackWrite,
          GeoPointJsonldBoulderFeedbackWriteBuilder
        > {
  @BuiltValueField(wireName: r'latitude')
  num get latitude;

  @BuiltValueField(wireName: r'longitude')
  num get longitude;

  GeoPointJsonldBoulderFeedbackWrite._();

  factory GeoPointJsonldBoulderFeedbackWrite([
    void updates(GeoPointJsonldBoulderFeedbackWriteBuilder b),
  ]) = _$GeoPointJsonldBoulderFeedbackWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeoPointJsonldBoulderFeedbackWriteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeoPointJsonldBoulderFeedbackWrite> get serializer =>
      _$GeoPointJsonldBoulderFeedbackWriteSerializer();
}

class _$GeoPointJsonldBoulderFeedbackWriteSerializer
    implements PrimitiveSerializer<GeoPointJsonldBoulderFeedbackWrite> {
  @override
  final Iterable<Type> types = const [
    GeoPointJsonldBoulderFeedbackWrite,
    _$GeoPointJsonldBoulderFeedbackWrite,
  ];

  @override
  final String wireName = r'GeoPointJsonldBoulderFeedbackWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeoPointJsonldBoulderFeedbackWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'latitude';
    yield serializers.serialize(
      object.latitude,
      specifiedType: const FullType(num),
    );
    yield r'longitude';
    yield serializers.serialize(
      object.longitude,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GeoPointJsonldBoulderFeedbackWrite object, {
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
    required GeoPointJsonldBoulderFeedbackWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'latitude':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(num))
                  as num;
          result.latitude = valueDes;
          break;
        case r'longitude':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(num))
                  as num;
          result.longitude = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GeoPointJsonldBoulderFeedbackWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeoPointJsonldBoulderFeedbackWriteBuilder();
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
