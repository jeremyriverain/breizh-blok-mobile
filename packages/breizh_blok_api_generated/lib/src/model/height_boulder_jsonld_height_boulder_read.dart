//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'height_boulder_jsonld_height_boulder_read.g.dart';

/// HeightBoulderJsonldHeightBoulderRead
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
@BuiltValue()
abstract class HeightBoulderJsonldHeightBoulderRead
    implements
        HydraItemBaseSchema,
        Built<
          HeightBoulderJsonldHeightBoulderRead,
          HeightBoulderJsonldHeightBoulderReadBuilder
        > {
  HeightBoulderJsonldHeightBoulderRead._();

  factory HeightBoulderJsonldHeightBoulderRead([
    void updates(HeightBoulderJsonldHeightBoulderReadBuilder b),
  ]) = _$HeightBoulderJsonldHeightBoulderRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HeightBoulderJsonldHeightBoulderReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HeightBoulderJsonldHeightBoulderRead> get serializer =>
      _$HeightBoulderJsonldHeightBoulderReadSerializer();
}

class _$HeightBoulderJsonldHeightBoulderReadSerializer
    implements PrimitiveSerializer<HeightBoulderJsonldHeightBoulderRead> {
  @override
  final Iterable<Type> types = const [
    HeightBoulderJsonldHeightBoulderRead,
    _$HeightBoulderJsonldHeightBoulderRead,
  ];

  @override
  final String wireName = r'HeightBoulderJsonldHeightBoulderRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HeightBoulderJsonldHeightBoulderRead object, {
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
    yield r'@type';
    yield serializers.serialize(
      object.atType,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    HeightBoulderJsonldHeightBoulderRead object, {
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
    required HeightBoulderJsonldHeightBoulderReadBuilder result,
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
  HeightBoulderJsonldHeightBoulderRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HeightBoulderJsonldHeightBoulderReadBuilder();
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
