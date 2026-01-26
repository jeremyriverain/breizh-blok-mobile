//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/hydra_collection_base_schema_all_of_hydra_view.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_collection_base_schema_no_pagination.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_collection_base_schema_no_pagination_hydra_search.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'hydra_collection_base_schema.g.dart';

/// HydraCollectionBaseSchema
///
/// Properties:
/// * [hydraColonTotalItems]
/// * [hydraColonSearch]
/// * [hydraColonView]
@BuiltValue(instantiable: false)
abstract class HydraCollectionBaseSchema
    implements HydraCollectionBaseSchemaNoPagination {
  @BuiltValueField(wireName: r'hydra:view')
  HydraCollectionBaseSchemaAllOfHydraView? get hydraColonView;

  @BuiltValueSerializer(custom: true)
  static Serializer<HydraCollectionBaseSchema> get serializer =>
      _$HydraCollectionBaseSchemaSerializer();
}

class _$HydraCollectionBaseSchemaSerializer
    implements PrimitiveSerializer<HydraCollectionBaseSchema> {
  @override
  final Iterable<Type> types = const [HydraCollectionBaseSchema];

  @override
  final String wireName = r'HydraCollectionBaseSchema';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HydraCollectionBaseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.hydraColonSearch != null) {
      yield r'hydra:search';
      yield serializers.serialize(
        object.hydraColonSearch,
        specifiedType: const FullType(
          HydraCollectionBaseSchemaNoPaginationHydraSearch,
        ),
      );
    }
    if (object.hydraColonTotalItems != null) {
      yield r'hydra:totalItems';
      yield serializers.serialize(
        object.hydraColonTotalItems,
        specifiedType: const FullType(int),
      );
    }
    if (object.hydraColonView != null) {
      yield r'hydra:view';
      yield serializers.serialize(
        object.hydraColonView,
        specifiedType: const FullType(HydraCollectionBaseSchemaAllOfHydraView),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    HydraCollectionBaseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(
      serializers,
      object,
      specifiedType: specifiedType,
    ).toList();
  }

  @override
  HydraCollectionBaseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(
          serialized,
          specifiedType: FullType($HydraCollectionBaseSchema),
        )
        as $HydraCollectionBaseSchema;
  }
}

/// a concrete implementation of [HydraCollectionBaseSchema], since [HydraCollectionBaseSchema] is not instantiable
@BuiltValue(instantiable: true)
abstract class $HydraCollectionBaseSchema
    implements
        HydraCollectionBaseSchema,
        Built<$HydraCollectionBaseSchema, $HydraCollectionBaseSchemaBuilder> {
  $HydraCollectionBaseSchema._();

  factory $HydraCollectionBaseSchema([
    void Function($HydraCollectionBaseSchemaBuilder)? updates,
  ]) = _$$HydraCollectionBaseSchema;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($HydraCollectionBaseSchemaBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$HydraCollectionBaseSchema> get serializer =>
      _$$HydraCollectionBaseSchemaSerializer();
}

class _$$HydraCollectionBaseSchemaSerializer
    implements PrimitiveSerializer<$HydraCollectionBaseSchema> {
  @override
  final Iterable<Type> types = const [
    $HydraCollectionBaseSchema,
    _$$HydraCollectionBaseSchema,
  ];

  @override
  final String wireName = r'$HydraCollectionBaseSchema';

  @override
  Object serialize(
    Serializers serializers,
    $HydraCollectionBaseSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(
      object,
      specifiedType: FullType(HydraCollectionBaseSchema),
    )!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HydraCollectionBaseSchemaBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'hydra:search':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      HydraCollectionBaseSchemaNoPaginationHydraSearch,
                    ),
                  )
                  as HydraCollectionBaseSchemaNoPaginationHydraSearch;
          result.hydraColonSearch.replace(valueDes);
          break;
        case r'hydra:totalItems':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.hydraColonTotalItems = valueDes;
          break;
        case r'hydra:view':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      HydraCollectionBaseSchemaAllOfHydraView,
                    ),
                  )
                  as HydraCollectionBaseSchemaAllOfHydraView;
          result.hydraColonView.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $HydraCollectionBaseSchema deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $HydraCollectionBaseSchemaBuilder();
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
