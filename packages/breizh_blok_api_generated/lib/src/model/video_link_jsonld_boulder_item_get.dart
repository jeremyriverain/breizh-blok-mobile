//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'video_link_jsonld_boulder_item_get.g.dart';

/// VideoLinkJsonldBoulderItemGet
///
/// Properties:
/// * [url]
/// * [videoId]
/// * [type]
@BuiltValue()
abstract class VideoLinkJsonldBoulderItemGet
    implements
        Built<
          VideoLinkJsonldBoulderItemGet,
          VideoLinkJsonldBoulderItemGetBuilder
        > {
  @BuiltValueField(wireName: r'url')
  String get url;

  @BuiltValueField(wireName: r'videoId')
  String? get videoId;

  @BuiltValueField(wireName: r'type')
  String? get type;

  VideoLinkJsonldBoulderItemGet._();

  factory VideoLinkJsonldBoulderItemGet([
    void updates(VideoLinkJsonldBoulderItemGetBuilder b),
  ]) = _$VideoLinkJsonldBoulderItemGet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VideoLinkJsonldBoulderItemGetBuilder b) =>
      b..type = 'youtube';

  @BuiltValueSerializer(custom: true)
  static Serializer<VideoLinkJsonldBoulderItemGet> get serializer =>
      _$VideoLinkJsonldBoulderItemGetSerializer();
}

class _$VideoLinkJsonldBoulderItemGetSerializer
    implements PrimitiveSerializer<VideoLinkJsonldBoulderItemGet> {
  @override
  final Iterable<Type> types = const [
    VideoLinkJsonldBoulderItemGet,
    _$VideoLinkJsonldBoulderItemGet,
  ];

  @override
  final String wireName = r'VideoLinkJsonldBoulderItemGet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VideoLinkJsonldBoulderItemGet object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'url';
    yield serializers.serialize(
      object.url,
      specifiedType: const FullType(String),
    );
    if (object.videoId != null) {
      yield r'videoId';
      yield serializers.serialize(
        object.videoId,
        specifiedType: const FullType(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    VideoLinkJsonldBoulderItemGet object, {
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
    required VideoLinkJsonldBoulderItemGetBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'url':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.url = valueDes;
          break;
        case r'videoId':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.videoId = valueDes;
          break;
        case r'type':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.type = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VideoLinkJsonldBoulderItemGet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VideoLinkJsonldBoulderItemGetBuilder();
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
