//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/auth_zero_user_jsonld_auth_zero_user_read_context.dart';
import 'package:breizh_blok_api_generated/src/model/boulder_jsonld_boulder_feedback_read.dart';
import 'package:breizh_blok_api_generated/src/model/geo_point_jsonld_boulder_feedback_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_feedback_jsonld_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [newLocation]
/// * [message]
/// * [boulder]
/// * [createdAt]
/// * [createdBy]
@BuiltValue()
abstract class BoulderFeedbackJsonldBoulderFeedbackRead
    implements
        Built<
          BoulderFeedbackJsonldBoulderFeedbackRead,
          BoulderFeedbackJsonldBoulderFeedbackReadBuilder
        > {
  @BuiltValueField(wireName: r'@context')
  AuthZeroUserJsonldAuthZeroUserReadContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'newLocation')
  GeoPointJsonldBoulderFeedbackRead? get newLocation;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'boulder')
  BoulderJsonldBoulderFeedbackRead get boulder;

  @BuiltValueField(wireName: r'createdAt')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'createdBy')
  String? get createdBy;

  BoulderFeedbackJsonldBoulderFeedbackRead._();

  factory BoulderFeedbackJsonldBoulderFeedbackRead([
    void updates(BoulderFeedbackJsonldBoulderFeedbackReadBuilder b),
  ]) = _$BoulderFeedbackJsonldBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderFeedbackJsonldBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderFeedbackJsonldBoulderFeedbackRead> get serializer =>
      _$BoulderFeedbackJsonldBoulderFeedbackReadSerializer();
}

class _$BoulderFeedbackJsonldBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<BoulderFeedbackJsonldBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    BoulderFeedbackJsonldBoulderFeedbackRead,
    _$BoulderFeedbackJsonldBoulderFeedbackRead,
  ];

  @override
  final String wireName = r'BoulderFeedbackJsonldBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderFeedbackJsonldBoulderFeedbackRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(
          AuthZeroUserJsonldAuthZeroUserReadContext,
        ),
      );
    }
    if (object.atId != null) {
      yield r'@id';
      yield serializers.serialize(
        object.atId,
        specifiedType: const FullType(String),
      );
    }
    if (object.atType != null) {
      yield r'@type';
      yield serializers.serialize(
        object.atType,
        specifiedType: const FullType(String),
      );
    }
    if (object.newLocation != null) {
      yield r'newLocation';
      yield serializers.serialize(
        object.newLocation,
        specifiedType: const FullType.nullable(
          GeoPointJsonldBoulderFeedbackRead,
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
      specifiedType: const FullType(BoulderJsonldBoulderFeedbackRead),
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
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderFeedbackJsonldBoulderFeedbackRead object, {
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
    required BoulderFeedbackJsonldBoulderFeedbackReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'@context':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      AuthZeroUserJsonldAuthZeroUserReadContext,
                    ),
                  )
                  as AuthZeroUserJsonldAuthZeroUserReadContext;
          result.atContext.replace(valueDes);
          break;
        case r'@id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.atId = valueDes;
          break;
        case r'@type':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.atType = valueDes;
          break;
        case r'newLocation':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(
                      GeoPointJsonldBoulderFeedbackRead,
                    ),
                  )
                  as GeoPointJsonldBoulderFeedbackRead?;
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
                      BoulderJsonldBoulderFeedbackRead,
                    ),
                  )
                  as BoulderJsonldBoulderFeedbackRead;
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
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.createdBy = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderFeedbackJsonldBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderFeedbackJsonldBoulderFeedbackReadBuilder();
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
