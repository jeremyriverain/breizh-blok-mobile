//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/geo_point_jsonld_boulder_feedback_write.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_feedback_jsonld_boulder_feedback_write.g.dart';

///
///
/// Properties:
/// * [newLocation]
/// * [message]
/// * [boulder]
@BuiltValue()
abstract class BoulderFeedbackJsonldBoulderFeedbackWrite
    implements
        Built<BoulderFeedbackJsonldBoulderFeedbackWrite,
            BoulderFeedbackJsonldBoulderFeedbackWriteBuilder> {
  @BuiltValueField(wireName: r'newLocation')
  GeoPointJsonldBoulderFeedbackWrite? get newLocation;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'boulder')
  String get boulder;

  BoulderFeedbackJsonldBoulderFeedbackWrite._();

  factory BoulderFeedbackJsonldBoulderFeedbackWrite(
          [void updates(BoulderFeedbackJsonldBoulderFeedbackWriteBuilder b)]) =
      _$BoulderFeedbackJsonldBoulderFeedbackWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderFeedbackJsonldBoulderFeedbackWriteBuilder b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderFeedbackJsonldBoulderFeedbackWrite> get serializer =>
      _$BoulderFeedbackJsonldBoulderFeedbackWriteSerializer();
}

class _$BoulderFeedbackJsonldBoulderFeedbackWriteSerializer
    implements PrimitiveSerializer<BoulderFeedbackJsonldBoulderFeedbackWrite> {
  @override
  final Iterable<Type> types = const [
    BoulderFeedbackJsonldBoulderFeedbackWrite,
    _$BoulderFeedbackJsonldBoulderFeedbackWrite
  ];

  @override
  final String wireName = r'BoulderFeedbackJsonldBoulderFeedbackWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderFeedbackJsonldBoulderFeedbackWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.newLocation != null) {
      yield r'newLocation';
      yield serializers.serialize(
        object.newLocation,
        specifiedType:
            const FullType.nullable(GeoPointJsonldBoulderFeedbackWrite),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderFeedbackJsonldBoulderFeedbackWrite object, {
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
    required BoulderFeedbackJsonldBoulderFeedbackWriteBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'newLocation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType.nullable(GeoPointJsonldBoulderFeedbackWrite),
          ) as GeoPointJsonldBoulderFeedbackWrite?;
          if (valueDes == null) continue;
          result.newLocation.replace(valueDes);
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.message = valueDes;
          break;
        case r'boulder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.boulder = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderFeedbackJsonldBoulderFeedbackWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderFeedbackJsonldBoulderFeedbackWriteBuilder();
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
