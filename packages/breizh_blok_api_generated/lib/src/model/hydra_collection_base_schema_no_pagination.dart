//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/hydra_collection_base_schema_no_pagination_hydra_search.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'hydra_collection_base_schema_no_pagination.g.dart';

/// HydraCollectionBaseSchemaNoPagination
///
/// Properties:
/// * [hydraColonTotalItems]
/// * [hydraColonSearch]
@BuiltValue(instantiable: false)
abstract class HydraCollectionBaseSchemaNoPagination {
  @BuiltValueField(wireName: r'hydra:totalItems')
  int? get hydraColonTotalItems;

  @BuiltValueField(wireName: r'hydra:search')
  HydraCollectionBaseSchemaNoPaginationHydraSearch? get hydraColonSearch;

  @BuiltValueSerializer(custom: true)
  static Serializer<HydraCollectionBaseSchemaNoPagination> get serializer =>
      _$HydraCollectionBaseSchemaNoPaginationSerializer();
}

class _$HydraCollectionBaseSchemaNoPaginationSerializer
    implements PrimitiveSerializer<HydraCollectionBaseSchemaNoPagination> {
  @override
  final Iterable<Type> types = const [HydraCollectionBaseSchemaNoPagination];

  @override
  final String wireName = r'HydraCollectionBaseSchemaNoPagination';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HydraCollectionBaseSchemaNoPagination object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.hydraColonTotalItems != null) {
      yield r'hydra:totalItems';
      yield serializers.serialize(
        object.hydraColonTotalItems,
        specifiedType: const FullType(int),
      );
    }
    if (object.hydraColonSearch != null) {
      yield r'hydra:search';
      yield serializers.serialize(
        object.hydraColonSearch,
        specifiedType: const FullType(
          HydraCollectionBaseSchemaNoPaginationHydraSearch,
        ),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    HydraCollectionBaseSchemaNoPagination object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(
      serializers,
      object,
      specifiedType: specifiedType,
    ).toList();
  }

  @override
  HydraCollectionBaseSchemaNoPagination deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(
          serialized,
          specifiedType: FullType($HydraCollectionBaseSchemaNoPagination),
        )
        as $HydraCollectionBaseSchemaNoPagination;
  }
}

/// a concrete implementation of [HydraCollectionBaseSchemaNoPagination], since [HydraCollectionBaseSchemaNoPagination] is not instantiable
@BuiltValue(instantiable: true)
abstract class $HydraCollectionBaseSchemaNoPagination
    implements
        HydraCollectionBaseSchemaNoPagination,
        Built<
          $HydraCollectionBaseSchemaNoPagination,
          $HydraCollectionBaseSchemaNoPaginationBuilder
        > {
  $HydraCollectionBaseSchemaNoPagination._();

  factory $HydraCollectionBaseSchemaNoPagination([
    void Function($HydraCollectionBaseSchemaNoPaginationBuilder)? updates,
  ]) = _$$HydraCollectionBaseSchemaNoPagination;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($HydraCollectionBaseSchemaNoPaginationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$HydraCollectionBaseSchemaNoPagination> get serializer =>
      _$$HydraCollectionBaseSchemaNoPaginationSerializer();
}

class _$$HydraCollectionBaseSchemaNoPaginationSerializer
    implements PrimitiveSerializer<$HydraCollectionBaseSchemaNoPagination> {
  @override
  final Iterable<Type> types = const [
    $HydraCollectionBaseSchemaNoPagination,
    _$$HydraCollectionBaseSchemaNoPagination,
  ];

  @override
  final String wireName = r'$HydraCollectionBaseSchemaNoPagination';

  @override
  Object serialize(
    Serializers serializers,
    $HydraCollectionBaseSchemaNoPagination object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(
      object,
      specifiedType: FullType(HydraCollectionBaseSchemaNoPagination),
    )!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required HydraCollectionBaseSchemaNoPaginationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'hydra:totalItems':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.hydraColonTotalItems = valueDes;
          break;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $HydraCollectionBaseSchemaNoPagination deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $HydraCollectionBaseSchemaNoPaginationBuilder();
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
