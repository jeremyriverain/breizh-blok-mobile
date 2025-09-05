//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/app_user_jsonld_boulder_feedback_read_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'geo_point_jsonld_boulder_area_item_get.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
@BuiltValue()
abstract class GeoPointJsonldBoulderAreaItemGet
    implements
        Built<
          GeoPointJsonldBoulderAreaItemGet,
          GeoPointJsonldBoulderAreaItemGetBuilder
        > {
  @BuiltValueField(wireName: r'@context')
  AppUserJsonldBoulderFeedbackReadContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  GeoPointJsonldBoulderAreaItemGet._();

  factory GeoPointJsonldBoulderAreaItemGet([
    void updates(GeoPointJsonldBoulderAreaItemGetBuilder b),
  ]) = _$GeoPointJsonldBoulderAreaItemGet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GeoPointJsonldBoulderAreaItemGetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GeoPointJsonldBoulderAreaItemGet> get serializer =>
      _$GeoPointJsonldBoulderAreaItemGetSerializer();
}

class _$GeoPointJsonldBoulderAreaItemGetSerializer
    implements PrimitiveSerializer<GeoPointJsonldBoulderAreaItemGet> {
  @override
  final Iterable<Type> types = const [
    GeoPointJsonldBoulderAreaItemGet,
    _$GeoPointJsonldBoulderAreaItemGet,
  ];

  @override
  final String wireName = r'GeoPointJsonldBoulderAreaItemGet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GeoPointJsonldBoulderAreaItemGet object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(AppUserJsonldBoulderFeedbackReadContext),
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
    GeoPointJsonldBoulderAreaItemGet object, {
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
    required GeoPointJsonldBoulderAreaItemGetBuilder result,
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
                      AppUserJsonldBoulderFeedbackReadContext,
                    ),
                  )
                  as AppUserJsonldBoulderFeedbackReadContext;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GeoPointJsonldBoulderAreaItemGet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeoPointJsonldBoulderAreaItemGetBuilder();
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
