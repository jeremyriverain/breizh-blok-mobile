//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_area_jsonld_municipality_read.g.dart';

/// BoulderAreaJsonldMunicipalityRead
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [name]
@BuiltValue()
abstract class BoulderAreaJsonldMunicipalityRead
    implements
        HydraItemBaseSchema,
        Built<
          BoulderAreaJsonldMunicipalityRead,
          BoulderAreaJsonldMunicipalityReadBuilder
        > {
  @BuiltValueField(wireName: r'name')
  String get name;

  BoulderAreaJsonldMunicipalityRead._();

  factory BoulderAreaJsonldMunicipalityRead([
    void updates(BoulderAreaJsonldMunicipalityReadBuilder b),
  ]) = _$BoulderAreaJsonldMunicipalityRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderAreaJsonldMunicipalityReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderAreaJsonldMunicipalityRead> get serializer =>
      _$BoulderAreaJsonldMunicipalityReadSerializer();
}

class _$BoulderAreaJsonldMunicipalityReadSerializer
    implements PrimitiveSerializer<BoulderAreaJsonldMunicipalityRead> {
  @override
  final Iterable<Type> types = const [
    BoulderAreaJsonldMunicipalityRead,
    _$BoulderAreaJsonldMunicipalityRead,
  ];

  @override
  final String wireName = r'BoulderAreaJsonldMunicipalityRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderAreaJsonldMunicipalityRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
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
    BoulderAreaJsonldMunicipalityRead object, {
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
    required BoulderAreaJsonldMunicipalityReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.name = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderAreaJsonldMunicipalityRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderAreaJsonldMunicipalityReadBuilder();
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
