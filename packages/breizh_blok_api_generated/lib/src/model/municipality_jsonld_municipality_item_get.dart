//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema_context.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'municipality_jsonld_municipality_item_get.g.dart';

/// MunicipalityJsonldMunicipalityItemGet
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [centroid]
@BuiltValue()
abstract class MunicipalityJsonldMunicipalityItemGet
    implements
        HydraItemBaseSchema,
        Built<
          MunicipalityJsonldMunicipalityItemGet,
          MunicipalityJsonldMunicipalityItemGetBuilder
        > {
  @BuiltValueField(wireName: r'centroid')
  JsonObject? get centroid;

  MunicipalityJsonldMunicipalityItemGet._();

  factory MunicipalityJsonldMunicipalityItemGet([
    void updates(MunicipalityJsonldMunicipalityItemGetBuilder b),
  ]) = _$MunicipalityJsonldMunicipalityItemGet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MunicipalityJsonldMunicipalityItemGetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MunicipalityJsonldMunicipalityItemGet> get serializer =>
      _$MunicipalityJsonldMunicipalityItemGetSerializer();
}

class _$MunicipalityJsonldMunicipalityItemGetSerializer
    implements PrimitiveSerializer<MunicipalityJsonldMunicipalityItemGet> {
  @override
  final Iterable<Type> types = const [
    MunicipalityJsonldMunicipalityItemGet,
    _$MunicipalityJsonldMunicipalityItemGet,
  ];

  @override
  final String wireName = r'MunicipalityJsonldMunicipalityItemGet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MunicipalityJsonldMunicipalityItemGet object, {
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
    if (object.centroid != null) {
      yield r'centroid';
      yield serializers.serialize(
        object.centroid,
        specifiedType: const FullType(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MunicipalityJsonldMunicipalityItemGet object, {
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
    required MunicipalityJsonldMunicipalityItemGetBuilder result,
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
        case r'centroid':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(JsonObject),
                  )
                  as JsonObject;
          result.centroid = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MunicipalityJsonldMunicipalityItemGet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MunicipalityJsonldMunicipalityItemGetBuilder();
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
