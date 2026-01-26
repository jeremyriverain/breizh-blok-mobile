//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'line_boulder_jsonld_boulder_read.g.dart';

/// LineBoulderJsonldBoulderRead
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [rockImage]
/// * [smoothLine]
@BuiltValue()
abstract class LineBoulderJsonldBoulderRead
    implements
        HydraItemBaseSchema,
        Built<
          LineBoulderJsonldBoulderRead,
          LineBoulderJsonldBoulderReadBuilder
        > {
  @BuiltValueField(wireName: r'rockImage')
  String get rockImage;

  @BuiltValueField(wireName: r'smoothLine')
  String get smoothLine;

  LineBoulderJsonldBoulderRead._();

  factory LineBoulderJsonldBoulderRead([
    void updates(LineBoulderJsonldBoulderReadBuilder b),
  ]) = _$LineBoulderJsonldBoulderRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LineBoulderJsonldBoulderReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LineBoulderJsonldBoulderRead> get serializer =>
      _$LineBoulderJsonldBoulderReadSerializer();
}

class _$LineBoulderJsonldBoulderReadSerializer
    implements PrimitiveSerializer<LineBoulderJsonldBoulderRead> {
  @override
  final Iterable<Type> types = const [
    LineBoulderJsonldBoulderRead,
    _$LineBoulderJsonldBoulderRead,
  ];

  @override
  final String wireName = r'LineBoulderJsonldBoulderRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LineBoulderJsonldBoulderRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'rockImage';
    yield serializers.serialize(
      object.rockImage,
      specifiedType: const FullType(String),
    );
    yield r'smoothLine';
    yield serializers.serialize(
      object.smoothLine,
      specifiedType: const FullType(String),
    );
    yield r'@type';
    yield serializers.serialize(
      object.atType,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LineBoulderJsonldBoulderRead object, {
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
    required LineBoulderJsonldBoulderReadBuilder result,
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
        case r'rockImage':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.rockImage = valueDes;
          break;
        case r'smoothLine':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.smoothLine = valueDes;
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
  LineBoulderJsonldBoulderRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LineBoulderJsonldBoulderReadBuilder();
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
