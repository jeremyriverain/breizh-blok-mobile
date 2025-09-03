//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/geo_point_boulder_feedback_write.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_feedback_boulder_feedback_write.g.dart';

///
///
/// Properties:
/// * [newLocation]
/// * [message]
/// * [boulder]
@BuiltValue()
abstract class BoulderFeedbackBoulderFeedbackWrite
    implements
        Built<
          BoulderFeedbackBoulderFeedbackWrite,
          BoulderFeedbackBoulderFeedbackWriteBuilder
        > {
  @BuiltValueField(wireName: r'newLocation')
  GeoPointBoulderFeedbackWrite? get newLocation;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'boulder')
  String get boulder;

  BoulderFeedbackBoulderFeedbackWrite._();

  factory BoulderFeedbackBoulderFeedbackWrite([
    void updates(BoulderFeedbackBoulderFeedbackWriteBuilder b),
  ]) = _$BoulderFeedbackBoulderFeedbackWrite;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderFeedbackBoulderFeedbackWriteBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderFeedbackBoulderFeedbackWrite> get serializer =>
      _$BoulderFeedbackBoulderFeedbackWriteSerializer();
}

class _$BoulderFeedbackBoulderFeedbackWriteSerializer
    implements PrimitiveSerializer<BoulderFeedbackBoulderFeedbackWrite> {
  @override
  final Iterable<Type> types = const [
    BoulderFeedbackBoulderFeedbackWrite,
    _$BoulderFeedbackBoulderFeedbackWrite,
  ];

  @override
  final String wireName = r'BoulderFeedbackBoulderFeedbackWrite';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderFeedbackBoulderFeedbackWrite object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.newLocation != null) {
      yield r'newLocation';
      yield serializers.serialize(
        object.newLocation,
        specifiedType: const FullType.nullable(GeoPointBoulderFeedbackWrite),
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
    BoulderFeedbackBoulderFeedbackWrite object, {
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
    required BoulderFeedbackBoulderFeedbackWriteBuilder result,
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
                      GeoPointBoulderFeedbackWrite,
                    ),
                  )
                  as GeoPointBoulderFeedbackWrite?;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderFeedbackBoulderFeedbackWrite deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderFeedbackBoulderFeedbackWriteBuilder();
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
