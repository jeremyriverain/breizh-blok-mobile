//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'geo_point_jsonld_write_boulder_feedback_write.g.dart';

///
///
/// Properties:
/// * [latitude]
/// * [longitude]
@BuiltValue()
abstract class GeoPointJsonldWriteBoulderFeedbackWrite
    implements
        Built<
          GeoPointJsonldWriteBoulderFeedbackWrite,
          GeoPointJsonldWriteBoulderFeedbackWriteBuilder
        > {
  @BuiltValueField(wireName: r'latitude')
  String? get latitude;

  @BuiltValueField(wireName: r'longitude')
  String? get longitude;

  GeoPointJsonldWriteBoulderFeedbackWrite._();

  factory GeoPointJsonldWriteBoulderFeedbackWrite([
    void updates(GeoPointJsonldWriteBoulderFeedbackWriteBuilder b),
  ]) = _$GeoPointJsonldWriteBoulderFeedbackWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeoPointJsonldWriteBoulderFeedbackWriteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeoPointJsonldWriteBoulderFeedbackWrite> get serializer =>
      _$GeoPointJsonldWriteBoulderFeedbackWriteSerializer();
}

class _$GeoPointJsonldWriteBoulderFeedbackWriteSerializer
    implements PrimitiveSerializer<GeoPointJsonldWriteBoulderFeedbackWrite> {
  @override
  final Iterable<Type> types = const [
    GeoPointJsonldWriteBoulderFeedbackWrite,
    _$GeoPointJsonldWriteBoulderFeedbackWrite,
  ];

  @override
  final String wireName = r'GeoPointJsonldWriteBoulderFeedbackWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeoPointJsonldWriteBoulderFeedbackWrite object, {
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
    GeoPointJsonldWriteBoulderFeedbackWrite object, {
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
    required GeoPointJsonldWriteBoulderFeedbackWriteBuilder result,
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
  GeoPointJsonldWriteBoulderFeedbackWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeoPointJsonldWriteBoulderFeedbackWriteBuilder();
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
