//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/height_boulder_boulder_item_get.dart';
import 'package:breizh_blok_api_generated/src/model/video_link_boulder_item_get.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_boulder_item_get.g.dart';

/// BoulderBoulderItemGet
///
/// Properties:
/// * [description]
/// * [height]
/// * [videoLinks]
@BuiltValue()
abstract class BoulderBoulderItemGet
    implements Built<BoulderBoulderItemGet, BoulderBoulderItemGetBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'height')
  HeightBoulderBoulderItemGet? get height;

  @BuiltValueField(wireName: r'videoLinks')
  BuiltList<VideoLinkBoulderItemGet>? get videoLinks;

  BoulderBoulderItemGet._();

  factory BoulderBoulderItemGet([
    void updates(BoulderBoulderItemGetBuilder b),
  ]) = _$BoulderBoulderItemGet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderBoulderItemGetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderBoulderItemGet> get serializer =>
      _$BoulderBoulderItemGetSerializer();
}

class _$BoulderBoulderItemGetSerializer
    implements PrimitiveSerializer<BoulderBoulderItemGet> {
  @override
  final Iterable<Type> types = const [
    BoulderBoulderItemGet,
    _$BoulderBoulderItemGet,
  ];

  @override
  final String wireName = r'BoulderBoulderItemGet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderBoulderItemGet object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.height != null) {
      yield r'height';
      yield serializers.serialize(
        object.height,
        specifiedType: const FullType.nullable(HeightBoulderBoulderItemGet),
      );
    }
    if (object.videoLinks != null) {
      yield r'videoLinks';
      yield serializers.serialize(
        object.videoLinks,
        specifiedType: const FullType(BuiltList, [
          FullType(VideoLinkBoulderItemGet),
        ]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderBoulderItemGet object, {
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
    required BoulderBoulderItemGetBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'height':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(
                      HeightBoulderBoulderItemGet,
                    ),
                  )
                  as HeightBoulderBoulderItemGet?;
          if (valueDes == null) continue;
          result.height.replace(valueDes);
          break;
        case r'videoLinks':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(VideoLinkBoulderItemGet),
                    ]),
                  )
                  as BuiltList<VideoLinkBoulderItemGet>;
          result.videoLinks.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderBoulderItemGet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderBoulderItemGetBuilder();
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
