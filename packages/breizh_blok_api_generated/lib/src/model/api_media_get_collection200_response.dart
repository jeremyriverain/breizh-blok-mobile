//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/api_boulders_get_collection200_response_hydra_search.dart';
import 'package:breizh_blok_api_generated/src/model/api_boulders_get_collection200_response_hydra_view.dart';
import 'package:breizh_blok_api_generated/src/model/media_jsonld.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_media_get_collection200_response.g.dart';

/// ApiMediaGetCollection200Response
///
/// Properties:
/// * [hydraColonMember]
/// * [hydraColonTotalItems]
/// * [hydraColonView]
/// * [hydraColonSearch]
@BuiltValue()
abstract class ApiMediaGetCollection200Response
    implements
        Built<
          ApiMediaGetCollection200Response,
          ApiMediaGetCollection200ResponseBuilder
        > {
  @BuiltValueField(wireName: r'hydra:member')
  BuiltList<MediaJsonld> get hydraColonMember;

  @BuiltValueField(wireName: r'hydra:totalItems')
  int? get hydraColonTotalItems;

  @BuiltValueField(wireName: r'hydra:view')
  ApiBouldersGetCollection200ResponseHydraView? get hydraColonView;

  @BuiltValueField(wireName: r'hydra:search')
  ApiBouldersGetCollection200ResponseHydraSearch? get hydraColonSearch;

  ApiMediaGetCollection200Response._();

  factory ApiMediaGetCollection200Response([
    void updates(ApiMediaGetCollection200ResponseBuilder b),
  ]) = _$ApiMediaGetCollection200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiMediaGetCollection200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiMediaGetCollection200Response> get serializer =>
      _$ApiMediaGetCollection200ResponseSerializer();
}

class _$ApiMediaGetCollection200ResponseSerializer
    implements PrimitiveSerializer<ApiMediaGetCollection200Response> {
  @override
  final Iterable<Type> types = const [
    ApiMediaGetCollection200Response,
    _$ApiMediaGetCollection200Response,
  ];

  @override
  final String wireName = r'ApiMediaGetCollection200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiMediaGetCollection200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'hydra:member';
    yield serializers.serialize(
      object.hydraColonMember,
      specifiedType: const FullType(BuiltList, [FullType(MediaJsonld)]),
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
        specifiedType: const FullType(
          ApiBouldersGetCollection200ResponseHydraView,
        ),
      );
    }
    if (object.hydraColonSearch != null) {
      yield r'hydra:search';
      yield serializers.serialize(
        object.hydraColonSearch,
        specifiedType: const FullType(
          ApiBouldersGetCollection200ResponseHydraSearch,
        ),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiMediaGetCollection200Response object, {
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
    required ApiMediaGetCollection200ResponseBuilder result,
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
                      FullType(MediaJsonld),
                    ]),
                  )
                  as BuiltList<MediaJsonld>;
          result.hydraColonMember.replace(valueDes);
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
                      ApiBouldersGetCollection200ResponseHydraView,
                    ),
                  )
                  as ApiBouldersGetCollection200ResponseHydraView;
          result.hydraColonView.replace(valueDes);
          break;
        case r'hydra:search':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      ApiBouldersGetCollection200ResponseHydraSearch,
                    ),
                  )
                  as ApiBouldersGetCollection200ResponseHydraSearch;
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
  ApiMediaGetCollection200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiMediaGetCollection200ResponseBuilder();
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
