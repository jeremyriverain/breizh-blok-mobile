//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'geo_point_read_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [latitude]
/// * [longitude]
@BuiltValue()
abstract class GeoPointReadBoulderFeedbackRead
    implements
        Built<
          GeoPointReadBoulderFeedbackRead,
          GeoPointReadBoulderFeedbackReadBuilder
        > {
  @BuiltValueField(wireName: r'latitude')
  String? get latitude;

  @BuiltValueField(wireName: r'longitude')
  String? get longitude;

  GeoPointReadBoulderFeedbackRead._();

  factory GeoPointReadBoulderFeedbackRead([
    void updates(GeoPointReadBoulderFeedbackReadBuilder b),
  ]) = _$GeoPointReadBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeoPointReadBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeoPointReadBoulderFeedbackRead> get serializer =>
      _$GeoPointReadBoulderFeedbackReadSerializer();
}

class _$GeoPointReadBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<GeoPointReadBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    GeoPointReadBoulderFeedbackRead,
    _$GeoPointReadBoulderFeedbackRead,
  ];

  @override
  final String wireName = r'GeoPointReadBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeoPointReadBoulderFeedbackRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'latitude';
    yield object.latitude == null
        ? null
        : serializers.serialize(
            object.latitude,
            specifiedType: const FullType.nullable(String),
          );
    yield r'longitude';
    yield object.longitude == null
        ? null
        : serializers.serialize(
            object.longitude,
            specifiedType: const FullType.nullable(String),
          );
  }

  @override
  Object serialize(
    Serializers serializers,
    GeoPointReadBoulderFeedbackRead object, {
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
    required GeoPointReadBoulderFeedbackReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'latitude':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.latitude = valueDes;
          break;
        case r'longitude':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
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
  GeoPointReadBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeoPointReadBoulderFeedbackReadBuilder();
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
