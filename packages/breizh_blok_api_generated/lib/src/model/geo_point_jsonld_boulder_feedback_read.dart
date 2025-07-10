//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/boulder_jsonld_boulder_item_get_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'geo_point_jsonld_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
@BuiltValue()
abstract class GeoPointJsonldBoulderFeedbackRead
    implements
        Built<GeoPointJsonldBoulderFeedbackRead,
            GeoPointJsonldBoulderFeedbackReadBuilder> {
  @BuiltValueField(wireName: r'@context')
  BoulderJsonldBoulderItemGetContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  GeoPointJsonldBoulderFeedbackRead._();

  factory GeoPointJsonldBoulderFeedbackRead(
          [void updates(GeoPointJsonldBoulderFeedbackReadBuilder b)]) =
      _$GeoPointJsonldBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeoPointJsonldBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeoPointJsonldBoulderFeedbackRead> get serializer =>
      _$GeoPointJsonldBoulderFeedbackReadSerializer();
}

class _$GeoPointJsonldBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<GeoPointJsonldBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    GeoPointJsonldBoulderFeedbackRead,
    _$GeoPointJsonldBoulderFeedbackRead
  ];

  @override
  final String wireName = r'GeoPointJsonldBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeoPointJsonldBoulderFeedbackRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(BoulderJsonldBoulderItemGetContext),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    GeoPointJsonldBoulderFeedbackRead object, {
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
    required GeoPointJsonldBoulderFeedbackReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'@context':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BoulderJsonldBoulderItemGetContext),
          ) as BoulderJsonldBoulderItemGetContext;
          result.atContext.replace(valueDes);
          break;
        case r'@id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.atId = valueDes;
          break;
        case r'@type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.atType = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GeoPointJsonldBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeoPointJsonldBoulderFeedbackReadBuilder();
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
