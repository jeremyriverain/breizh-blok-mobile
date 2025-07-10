//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/boulder_boulder_feedback_read.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_feedback_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [newLocation] -
/// * [message]
/// * [sentBy]
/// * [boulder]
/// * [createdAt]
@BuiltValue()
abstract class BoulderFeedbackBoulderFeedbackRead
    implements
        Built<BoulderFeedbackBoulderFeedbackRead,
            BoulderFeedbackBoulderFeedbackReadBuilder> {
  ///
  @BuiltValueField(wireName: r'newLocation')
  JsonObject? get newLocation;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'sentBy')
  String? get sentBy;

  @BuiltValueField(wireName: r'boulder')
  BoulderBoulderFeedbackRead get boulder;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  BoulderFeedbackBoulderFeedbackRead._();

  factory BoulderFeedbackBoulderFeedbackRead(
          [void updates(BoulderFeedbackBoulderFeedbackReadBuilder b)]) =
      _$BoulderFeedbackBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderFeedbackBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderFeedbackBoulderFeedbackRead> get serializer =>
      _$BoulderFeedbackBoulderFeedbackReadSerializer();
}

class _$BoulderFeedbackBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<BoulderFeedbackBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    BoulderFeedbackBoulderFeedbackRead,
    _$BoulderFeedbackBoulderFeedbackRead
  ];

  @override
  final String wireName = r'BoulderFeedbackBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderFeedbackBoulderFeedbackRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.newLocation != null) {
      yield r'newLocation';
      yield serializers.serialize(
        object.newLocation,
        specifiedType: const FullType(JsonObject),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sentBy != null) {
      yield r'sentBy';
      yield serializers.serialize(
        object.sentBy,
        specifiedType: const FullType(String),
      );
    }
    yield r'boulder';
    yield serializers.serialize(
      object.boulder,
      specifiedType: const FullType(BoulderBoulderFeedbackRead),
    );
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderFeedbackBoulderFeedbackRead object, {
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
    required BoulderFeedbackBoulderFeedbackReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'newLocation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.newLocation = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.message = valueDes;
          break;
        case r'sentBy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sentBy = valueDes;
          break;
        case r'boulder':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BoulderBoulderFeedbackRead),
          ) as BoulderBoulderFeedbackRead;
          result.boulder.replace(valueDes);
          break;
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderFeedbackBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderFeedbackBoulderFeedbackReadBuilder();
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
