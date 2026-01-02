//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/auth_zero_user_jsonld_auth_zero_user_read_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'geo_point_jsonld_read_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [latitude]
/// * [longitude]
@BuiltValue()
abstract class GeoPointJsonldReadBoulderFeedbackRead
    implements
        Built<
          GeoPointJsonldReadBoulderFeedbackRead,
          GeoPointJsonldReadBoulderFeedbackReadBuilder
        > {
  @BuiltValueField(wireName: r'@context')
  AuthZeroUserJsonldAuthZeroUserReadContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'latitude')
  String? get latitude;

  @BuiltValueField(wireName: r'longitude')
  String? get longitude;

  GeoPointJsonldReadBoulderFeedbackRead._();

  factory GeoPointJsonldReadBoulderFeedbackRead([
    void updates(GeoPointJsonldReadBoulderFeedbackReadBuilder b),
  ]) = _$GeoPointJsonldReadBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeoPointJsonldReadBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeoPointJsonldReadBoulderFeedbackRead> get serializer =>
      _$GeoPointJsonldReadBoulderFeedbackReadSerializer();
}

class _$GeoPointJsonldReadBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<GeoPointJsonldReadBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    GeoPointJsonldReadBoulderFeedbackRead,
    _$GeoPointJsonldReadBoulderFeedbackRead,
  ];

  @override
  final String wireName = r'GeoPointJsonldReadBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeoPointJsonldReadBoulderFeedbackRead object, {
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
    GeoPointJsonldReadBoulderFeedbackRead object, {
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
    required GeoPointJsonldReadBoulderFeedbackReadBuilder result,
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
  GeoPointJsonldReadBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeoPointJsonldReadBoulderFeedbackReadBuilder();
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
