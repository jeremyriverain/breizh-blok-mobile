//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema.dart';
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema_context.dart';
import 'package:breizh_blok_api_generated/src/model/video_link_jsonld_boulder_item_get.dart';
import 'package:breizh_blok_api_generated/src/model/height_boulder_jsonld_boulder_item_get.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_jsonld_boulder_item_get.g.dart';

/// BoulderJsonldBoulderItemGet
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [description]
/// * [height]
/// * [videoLinks]
@BuiltValue()
abstract class BoulderJsonldBoulderItemGet
    implements
        HydraItemBaseSchema,
        Built<BoulderJsonldBoulderItemGet, BoulderJsonldBoulderItemGetBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'videoLinks')
  BuiltList<VideoLinkJsonldBoulderItemGet>? get videoLinks;

  @BuiltValueField(wireName: r'height')
  HeightBoulderJsonldBoulderItemGet? get height;

  BoulderJsonldBoulderItemGet._();

  factory BoulderJsonldBoulderItemGet([
    void updates(BoulderJsonldBoulderItemGetBuilder b),
  ]) = _$BoulderJsonldBoulderItemGet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderJsonldBoulderItemGetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderJsonldBoulderItemGet> get serializer =>
      _$BoulderJsonldBoulderItemGetSerializer();
}

class _$BoulderJsonldBoulderItemGetSerializer
    implements PrimitiveSerializer<BoulderJsonldBoulderItemGet> {
  @override
  final Iterable<Type> types = const [
    BoulderJsonldBoulderItemGet,
    _$BoulderJsonldBoulderItemGet,
  ];

  @override
  final String wireName = r'BoulderJsonldBoulderItemGet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderJsonldBoulderItemGet object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(HydraItemBaseSchemaContext),
      );
    }
    yield r'@id';
    yield serializers.serialize(
      object.atId,
      specifiedType: const FullType(String),
    );
    yield r'@type';
    yield serializers.serialize(
      object.atType,
      specifiedType: const FullType(String),
    );
    if (object.videoLinks != null) {
      yield r'videoLinks';
      yield serializers.serialize(
        object.videoLinks,
        specifiedType: const FullType(BuiltList, [
          FullType(VideoLinkJsonldBoulderItemGet),
        ]),
      );
    }
    if (object.height != null) {
      yield r'height';
      yield serializers.serialize(
        object.height,
        specifiedType: const FullType.nullable(
          HeightBoulderJsonldBoulderItemGet,
        ),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderJsonldBoulderItemGet object, {
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
    required BoulderJsonldBoulderItemGetBuilder result,
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
        case r'@context':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(HydraItemBaseSchemaContext),
                  )
                  as HydraItemBaseSchemaContext;
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
        case r'videoLinks':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(VideoLinkJsonldBoulderItemGet),
                    ]),
                  )
                  as BuiltList<VideoLinkJsonldBoulderItemGet>;
          result.videoLinks.replace(valueDes);
          break;
        case r'height':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(
                      HeightBoulderJsonldBoulderItemGet,
                    ),
                  )
                  as HeightBoulderJsonldBoulderItemGet?;
          if (valueDes == null) continue;
          result.height.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderJsonldBoulderItemGet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderJsonldBoulderItemGetBuilder();
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
