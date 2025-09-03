//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'dart:typed_data';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'media.g.dart';

///
///
/// Properties:
/// * [id]
/// * [file]
/// * [filePath]
/// * [updatedAt]
/// * [rock]
/// * [lineBoulders]
/// * [filterUrl]
/// * [contentUrl]
/// * [imageDimensions]
/// * [mediaAttributes]
/// * [media]
@BuiltValue()
abstract class Media implements Built<Media, MediaBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'file')
  Uint8List? get file;

  @BuiltValueField(wireName: r'filePath')
  String? get filePath;

  @BuiltValueField(wireName: r'updatedAt')
  DateTime? get updatedAt;

  @BuiltValueField(wireName: r'rock')
  String? get rock;

  @BuiltValueField(wireName: r'lineBoulders')
  BuiltList<String>? get lineBoulders;

  @BuiltValueField(wireName: r'filterUrl')
  String? get filterUrl;

  @BuiltValueField(wireName: r'contentUrl')
  String? get contentUrl;

  @BuiltValueField(wireName: r'imageDimensions')
  BuiltList<String>? get imageDimensions;

  @BuiltValueField(wireName: r'mediaAttributes')
  BuiltList<String>? get mediaAttributes;

  @BuiltValueField(wireName: r'media')
  String? get media;

  Media._();

  factory Media([void updates(MediaBuilder b)]) = _$Media;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MediaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Media> get serializer => _$MediaSerializer();
}

class _$MediaSerializer implements PrimitiveSerializer<Media> {
  @override
  final Iterable<Type> types = const [Media, _$Media];

  @override
  final String wireName = r'Media';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Media object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.file != null) {
      yield r'file';
      yield serializers.serialize(
        object.file,
        specifiedType: const FullType.nullable(Uint8List),
      );
    }
    if (object.filePath != null) {
      yield r'filePath';
      yield serializers.serialize(
        object.filePath,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.updatedAt != null) {
      yield r'updatedAt';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.rock != null) {
      yield r'rock';
      yield serializers.serialize(
        object.rock,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.lineBoulders != null) {
      yield r'lineBoulders';
      yield serializers.serialize(
        object.lineBoulders,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.filterUrl != null) {
      yield r'filterUrl';
      yield serializers.serialize(
        object.filterUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.contentUrl != null) {
      yield r'contentUrl';
      yield serializers.serialize(
        object.contentUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.imageDimensions != null) {
      yield r'imageDimensions';
      yield serializers.serialize(
        object.imageDimensions,
        specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
      );
    }
    if (object.mediaAttributes != null) {
      yield r'mediaAttributes';
      yield serializers.serialize(
        object.mediaAttributes,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.media != null) {
      yield r'media';
      yield serializers.serialize(
        object.media,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Media object, {
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
    required MediaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.id = valueDes;
          break;
        case r'file':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(Uint8List),
                  )
                  as Uint8List?;
          if (valueDes == null) continue;
          result.file = valueDes;
          break;
        case r'filePath':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.filePath = valueDes;
          break;
        case r'updatedAt':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'rock':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.rock = valueDes;
          break;
        case r'lineBoulders':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(String),
                    ]),
                  )
                  as BuiltList<String>;
          result.lineBoulders.replace(valueDes);
          break;
        case r'filterUrl':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.filterUrl = valueDes;
          break;
        case r'contentUrl':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.contentUrl = valueDes;
          break;
        case r'imageDimensions':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(BuiltList, [
                      FullType(String),
                    ]),
                  )
                  as BuiltList<String>?;
          if (valueDes == null) continue;
          result.imageDimensions.replace(valueDes);
          break;
        case r'mediaAttributes':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(String),
                    ]),
                  )
                  as BuiltList<String>;
          result.mediaAttributes.replace(valueDes);
          break;
        case r'media':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.media = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Media deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MediaBuilder();
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
