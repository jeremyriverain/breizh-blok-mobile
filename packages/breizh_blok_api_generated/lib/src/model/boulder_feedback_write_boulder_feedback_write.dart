//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/geo_point_write_boulder_feedback_write.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_feedback_write_boulder_feedback_write.g.dart';

/// BoulderFeedbackWriteBoulderFeedbackWrite
///
/// Properties:
/// * [newLocation]
/// * [message]
/// * [boulder]
/// * [videoLink]
@BuiltValue()
abstract class BoulderFeedbackWriteBoulderFeedbackWrite
    implements
        Built<
          BoulderFeedbackWriteBoulderFeedbackWrite,
          BoulderFeedbackWriteBoulderFeedbackWriteBuilder
        > {
  @BuiltValueField(wireName: r'newLocation')
  GeoPointWriteBoulderFeedbackWrite? get newLocation;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'boulder')
  String get boulder;

  @BuiltValueField(wireName: r'videoLink')
  String? get videoLink;

  BoulderFeedbackWriteBoulderFeedbackWrite._();

  factory BoulderFeedbackWriteBoulderFeedbackWrite([
    void updates(BoulderFeedbackWriteBoulderFeedbackWriteBuilder b),
  ]) = _$BoulderFeedbackWriteBoulderFeedbackWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderFeedbackWriteBoulderFeedbackWriteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderFeedbackWriteBoulderFeedbackWrite> get serializer =>
      _$BoulderFeedbackWriteBoulderFeedbackWriteSerializer();
}

class _$BoulderFeedbackWriteBoulderFeedbackWriteSerializer
    implements PrimitiveSerializer<BoulderFeedbackWriteBoulderFeedbackWrite> {
  @override
  final Iterable<Type> types = const [
    BoulderFeedbackWriteBoulderFeedbackWrite,
    _$BoulderFeedbackWriteBoulderFeedbackWrite,
  ];

  @override
  final String wireName = r'BoulderFeedbackWriteBoulderFeedbackWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderFeedbackWriteBoulderFeedbackWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.newLocation != null) {
      yield r'newLocation';
      yield serializers.serialize(
        object.newLocation,
        specifiedType: const FullType.nullable(
          GeoPointWriteBoulderFeedbackWrite,
        ),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'boulder';
    yield serializers.serialize(
      object.boulder,
      specifiedType: const FullType(String),
    );
    if (object.videoLink != null) {
      yield r'videoLink';
      yield serializers.serialize(
        object.videoLink,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderFeedbackWriteBoulderFeedbackWrite object, {
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
    required BoulderFeedbackWriteBoulderFeedbackWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'newLocation':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(
                      GeoPointWriteBoulderFeedbackWrite,
                    ),
                  )
                  as GeoPointWriteBoulderFeedbackWrite?;
          if (valueDes == null) continue;
          result.newLocation.replace(valueDes);
          break;
        case r'message':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.message = valueDes;
          break;
        case r'boulder':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.boulder = valueDes;
          break;
        case r'videoLink':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.videoLink = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderFeedbackWriteBoulderFeedbackWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderFeedbackWriteBoulderFeedbackWriteBuilder();
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
