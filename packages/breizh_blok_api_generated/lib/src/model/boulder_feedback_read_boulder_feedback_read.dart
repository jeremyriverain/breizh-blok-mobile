//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/auth_zero_user_read_boulder_feedback_read.dart';
import 'package:breizh_blok_api_generated/src/model/boulder_read_boulder_feedback_read.dart';
import 'package:breizh_blok_api_generated/src/model/geo_point_read_boulder_feedback_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_feedback_read_boulder_feedback_read.g.dart';

/// BoulderFeedbackReadBoulderFeedbackRead
///
/// Properties:
/// * [newLocation]
/// * [message]
/// * [boulder]
/// * [createdAt]
/// * [createdBy]
/// * [videoLink]
@BuiltValue()
abstract class BoulderFeedbackReadBoulderFeedbackRead
    implements
        Built<
          BoulderFeedbackReadBoulderFeedbackRead,
          BoulderFeedbackReadBoulderFeedbackReadBuilder
        > {
  @BuiltValueField(wireName: r'newLocation')
  GeoPointReadBoulderFeedbackRead? get newLocation;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'boulder')
  BoulderReadBoulderFeedbackRead get boulder;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'createdBy')
  AuthZeroUserReadBoulderFeedbackRead? get createdBy;

  @BuiltValueField(wireName: r'videoLink')
  String? get videoLink;

  BoulderFeedbackReadBoulderFeedbackRead._();

  factory BoulderFeedbackReadBoulderFeedbackRead([
    void updates(BoulderFeedbackReadBoulderFeedbackReadBuilder b),
  ]) = _$BoulderFeedbackReadBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderFeedbackReadBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderFeedbackReadBoulderFeedbackRead> get serializer =>
      _$BoulderFeedbackReadBoulderFeedbackReadSerializer();
}

class _$BoulderFeedbackReadBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<BoulderFeedbackReadBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    BoulderFeedbackReadBoulderFeedbackRead,
    _$BoulderFeedbackReadBoulderFeedbackRead,
  ];

  @override
  final String wireName = r'BoulderFeedbackReadBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderFeedbackReadBoulderFeedbackRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.newLocation != null) {
      yield r'newLocation';
      yield serializers.serialize(
        object.newLocation,
        specifiedType: const FullType.nullable(GeoPointReadBoulderFeedbackRead),
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
      specifiedType: const FullType(BoulderReadBoulderFeedbackRead),
    );
    if (object.createdAt != null) {
      yield r'createdAt';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.createdBy != null) {
      yield r'createdBy';
      yield serializers.serialize(
        object.createdBy,
        specifiedType: const FullType.nullable(
          AuthZeroUserReadBoulderFeedbackRead,
        ),
      );
    }
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
    BoulderFeedbackReadBoulderFeedbackRead object, {
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
    required BoulderFeedbackReadBoulderFeedbackReadBuilder result,
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
                      GeoPointReadBoulderFeedbackRead,
                    ),
                  )
                  as GeoPointReadBoulderFeedbackRead?;
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
                    specifiedType: const FullType(
                      BoulderReadBoulderFeedbackRead,
                    ),
                  )
                  as BoulderReadBoulderFeedbackRead;
          result.boulder.replace(valueDes);
          break;
        case r'createdAt':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime;
          result.createdAt = valueDes;
          break;
        case r'createdBy':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(
                      AuthZeroUserReadBoulderFeedbackRead,
                    ),
                  )
                  as AuthZeroUserReadBoulderFeedbackRead?;
          if (valueDes == null) continue;
          result.createdBy.replace(valueDes);
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
  BoulderFeedbackReadBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderFeedbackReadBoulderFeedbackReadBuilder();
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
