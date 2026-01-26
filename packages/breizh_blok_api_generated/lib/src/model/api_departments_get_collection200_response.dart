//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_collection_base_schema_all_of_hydra_view.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_collection_base_schema.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_collection_base_schema_no_pagination_hydra_search.dart';
import 'package:breizh_blok_api_generated/src/model/department_jsonld_department_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_departments_get_collection200_response.g.dart';

/// Department.jsonld-Department.read collection.
///
/// Properties:
/// * [hydraColonTotalItems]
/// * [hydraColonSearch]
/// * [hydraColonView]
/// * [hydraColonMember]
@BuiltValue()
abstract class ApiDepartmentsGetCollection200Response
    implements
        HydraCollectionBaseSchema,
        Built<
          ApiDepartmentsGetCollection200Response,
          ApiDepartmentsGetCollection200ResponseBuilder
        > {
  @BuiltValueField(wireName: r'hydra:member')
  BuiltList<DepartmentJsonldDepartmentRead> get hydraColonMember;

  ApiDepartmentsGetCollection200Response._();

  factory ApiDepartmentsGetCollection200Response([
    void updates(ApiDepartmentsGetCollection200ResponseBuilder b),
  ]) = _$ApiDepartmentsGetCollection200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiDepartmentsGetCollection200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiDepartmentsGetCollection200Response> get serializer =>
      _$ApiDepartmentsGetCollection200ResponseSerializer();
}

class _$ApiDepartmentsGetCollection200ResponseSerializer
    implements PrimitiveSerializer<ApiDepartmentsGetCollection200Response> {
  @override
  final Iterable<Type> types = const [
    ApiDepartmentsGetCollection200Response,
    _$ApiDepartmentsGetCollection200Response,
  ];

  @override
  final String wireName = r'ApiDepartmentsGetCollection200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiDepartmentsGetCollection200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'hydra:member';
    yield serializers.serialize(
      object.hydraColonMember,
      specifiedType: const FullType(BuiltList, [
        FullType(DepartmentJsonldDepartmentRead),
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
    ApiDepartmentsGetCollection200Response object, {
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
    required ApiDepartmentsGetCollection200ResponseBuilder result,
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
                      FullType(DepartmentJsonldDepartmentRead),
                    ]),
                  )
                  as BuiltList<DepartmentJsonldDepartmentRead>;
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
  ApiDepartmentsGetCollection200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiDepartmentsGetCollection200ResponseBuilder();
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
