//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/boulder_area_jsonld_boulder_area_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/api_boulders_get_collection200_response_hydra_search.dart';
import 'package:breizh_blok_api_generated/src/model/api_boulders_get_collection200_response_hydra_view.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_boulder_areas_get_collection200_response.g.dart';

/// ApiBoulderAreasGetCollection200Response
///
/// Properties:
/// * [hydraColonMember]
/// * [hydraColonTotalItems]
/// * [hydraColonView]
/// * [hydraColonSearch]
@BuiltValue()
abstract class ApiBoulderAreasGetCollection200Response
    implements
        Built<ApiBoulderAreasGetCollection200Response,
            ApiBoulderAreasGetCollection200ResponseBuilder> {
  @BuiltValueField(wireName: r'hydra:member')
  BuiltList<BoulderAreaJsonldBoulderAreaRead> get hydraColonMember;

  @BuiltValueField(wireName: r'hydra:totalItems')
  int? get hydraColonTotalItems;

  @BuiltValueField(wireName: r'hydra:view')
  ApiBouldersGetCollection200ResponseHydraView? get hydraColonView;

  @BuiltValueField(wireName: r'hydra:search')
  ApiBouldersGetCollection200ResponseHydraSearch? get hydraColonSearch;

  ApiBoulderAreasGetCollection200Response._();

  factory ApiBoulderAreasGetCollection200Response(
          [void updates(ApiBoulderAreasGetCollection200ResponseBuilder b)]) =
      _$ApiBoulderAreasGetCollection200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiBoulderAreasGetCollection200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiBoulderAreasGetCollection200Response> get serializer =>
      _$ApiBoulderAreasGetCollection200ResponseSerializer();
}

class _$ApiBoulderAreasGetCollection200ResponseSerializer
    implements PrimitiveSerializer<ApiBoulderAreasGetCollection200Response> {
  @override
  final Iterable<Type> types = const [
    ApiBoulderAreasGetCollection200Response,
    _$ApiBoulderAreasGetCollection200Response
  ];

  @override
  final String wireName = r'ApiBoulderAreasGetCollection200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiBoulderAreasGetCollection200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'hydra:member';
    yield serializers.serialize(
      object.hydraColonMember,
      specifiedType: const FullType(
          BuiltList, [FullType(BoulderAreaJsonldBoulderAreaRead)]),
    );
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
        specifiedType:
            const FullType(ApiBouldersGetCollection200ResponseHydraView),
      );
    }
    if (object.hydraColonSearch != null) {
      yield r'hydra:search';
      yield serializers.serialize(
        object.hydraColonSearch,
        specifiedType:
            const FullType(ApiBouldersGetCollection200ResponseHydraSearch),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiBoulderAreasGetCollection200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApiBoulderAreasGetCollection200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'hydra:member':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(BoulderAreaJsonldBoulderAreaRead)]),
          ) as BuiltList<BoulderAreaJsonldBoulderAreaRead>;
          result.hydraColonMember.replace(valueDes);
          break;
        case r'hydra:totalItems':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.hydraColonTotalItems = valueDes;
          break;
        case r'hydra:view':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(ApiBouldersGetCollection200ResponseHydraView),
          ) as ApiBouldersGetCollection200ResponseHydraView;
          result.hydraColonView.replace(valueDes);
          break;
        case r'hydra:search':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(ApiBouldersGetCollection200ResponseHydraSearch),
          ) as ApiBouldersGetCollection200ResponseHydraSearch;
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
  ApiBoulderAreasGetCollection200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiBoulderAreasGetCollection200ResponseBuilder();
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
