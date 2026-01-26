//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_collection_base_schema_no_pagination_hydra_search_hydra_mapping_inner.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'hydra_collection_base_schema_no_pagination_hydra_search.g.dart';

/// HydraCollectionBaseSchemaNoPaginationHydraSearch
///
/// Properties:
/// * [atType]
/// * [hydraColonTemplate]
/// * [hydraColonVariableRepresentation]
/// * [hydraColonMapping]
@BuiltValue()
abstract class HydraCollectionBaseSchemaNoPaginationHydraSearch
    implements
        Built<
          HydraCollectionBaseSchemaNoPaginationHydraSearch,
          HydraCollectionBaseSchemaNoPaginationHydraSearchBuilder
        > {
  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'hydra:template')
  String? get hydraColonTemplate;

  @BuiltValueField(wireName: r'hydra:variableRepresentation')
  String? get hydraColonVariableRepresentation;

  @BuiltValueField(wireName: r'hydra:mapping')
  BuiltList<HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner>?
  get hydraColonMapping;

  HydraCollectionBaseSchemaNoPaginationHydraSearch._();

  factory HydraCollectionBaseSchemaNoPaginationHydraSearch([
    void updates(HydraCollectionBaseSchemaNoPaginationHydraSearchBuilder b),
  ]) = _$HydraCollectionBaseSchemaNoPaginationHydraSearch;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(
    HydraCollectionBaseSchemaNoPaginationHydraSearchBuilder b,
  ) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HydraCollectionBaseSchemaNoPaginationHydraSearch>
  get serializer =>
      _$HydraCollectionBaseSchemaNoPaginationHydraSearchSerializer();
}

class _$HydraCollectionBaseSchemaNoPaginationHydraSearchSerializer
    implements
        PrimitiveSerializer<HydraCollectionBaseSchemaNoPaginationHydraSearch> {
  @override
  final Iterable<Type> types = const [
    HydraCollectionBaseSchemaNoPaginationHydraSearch,
    _$HydraCollectionBaseSchemaNoPaginationHydraSearch,
  ];

  @override
  final String wireName = r'HydraCollectionBaseSchemaNoPaginationHydraSearch';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HydraCollectionBaseSchemaNoPaginationHydraSearch object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.atType != null) {
      yield r'@type';
      yield serializers.serialize(
        object.atType,
        specifiedType: const FullType(String),
      );
    }
    if (object.hydraColonTemplate != null) {
      yield r'hydra:template';
      yield serializers.serialize(
        object.hydraColonTemplate,
        specifiedType: const FullType(String),
      );
    }
    if (object.hydraColonVariableRepresentation != null) {
      yield r'hydra:variableRepresentation';
      yield serializers.serialize(
        object.hydraColonVariableRepresentation,
        specifiedType: const FullType(String),
      );
    }
    if (object.hydraColonMapping != null) {
      yield r'hydra:mapping';
      yield serializers.serialize(
        object.hydraColonMapping,
        specifiedType: const FullType(BuiltList, [
          FullType(
            HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner,
          ),
        ]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    HydraCollectionBaseSchemaNoPaginationHydraSearch object, {
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
    required HydraCollectionBaseSchemaNoPaginationHydraSearchBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'@type':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.atType = valueDes;
          break;
        case r'hydra:template':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.hydraColonTemplate = valueDes;
          break;
        case r'hydra:variableRepresentation':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.hydraColonVariableRepresentation = valueDes;
          break;
        case r'hydra:mapping':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(
                        HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner,
                      ),
                    ]),
                  )
                  as BuiltList<
                    HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner
                  >;
          result.hydraColonMapping.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HydraCollectionBaseSchemaNoPaginationHydraSearch deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HydraCollectionBaseSchemaNoPaginationHydraSearchBuilder();
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
