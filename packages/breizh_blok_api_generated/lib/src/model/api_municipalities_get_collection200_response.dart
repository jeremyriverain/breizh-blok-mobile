//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_collection_base_schema_all_of_hydra_view.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_collection_base_schema.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_collection_base_schema_no_pagination_hydra_search.dart';
import 'package:breizh_blok_api_generated/src/model/municipality_jsonld_municipality_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_municipalities_get_collection200_response.g.dart';

/// Municipality.jsonld-Municipality.read collection.
///
/// Properties:
/// * [hydraColonTotalItems]
/// * [hydraColonSearch]
/// * [hydraColonView]
/// * [hydraColonMember]
@BuiltValue()
abstract class ApiMunicipalitiesGetCollection200Response
    implements
        HydraCollectionBaseSchema,
        Built<
          ApiMunicipalitiesGetCollection200Response,
          ApiMunicipalitiesGetCollection200ResponseBuilder
        > {
  @BuiltValueField(wireName: r'hydra:member')
  BuiltList<MunicipalityJsonldMunicipalityRead> get hydraColonMember;

  ApiMunicipalitiesGetCollection200Response._();

  factory ApiMunicipalitiesGetCollection200Response([
    void updates(ApiMunicipalitiesGetCollection200ResponseBuilder b),
  ]) = _$ApiMunicipalitiesGetCollection200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiMunicipalitiesGetCollection200ResponseBuilder b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiMunicipalitiesGetCollection200Response> get serializer =>
      _$ApiMunicipalitiesGetCollection200ResponseSerializer();
}

class _$ApiMunicipalitiesGetCollection200ResponseSerializer
    implements PrimitiveSerializer<ApiMunicipalitiesGetCollection200Response> {
  @override
  final Iterable<Type> types = const [
    ApiMunicipalitiesGetCollection200Response,
    _$ApiMunicipalitiesGetCollection200Response,
  ];

  @override
  final String wireName = r'ApiMunicipalitiesGetCollection200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiMunicipalitiesGetCollection200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'hydra:member';
    yield serializers.serialize(
      object.hydraColonMember,
      specifiedType: const FullType(BuiltList, [
        FullType(MunicipalityJsonldMunicipalityRead),
      ]),
    );
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
    ApiMunicipalitiesGetCollection200Response object, {
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
    required ApiMunicipalitiesGetCollection200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'hydra:member':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(MunicipalityJsonldMunicipalityRead),
                    ]),
                  )
                  as BuiltList<MunicipalityJsonldMunicipalityRead>;
          result.hydraColonMember.replace(valueDes);
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
  ApiMunicipalitiesGetCollection200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiMunicipalitiesGetCollection200ResponseBuilder();
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
