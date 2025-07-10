//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/api_boulders_get_collection200_response_hydra_search_hydra_mapping_inner.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_boulders_get_collection200_response_hydra_search.g.dart';

/// ApiBouldersGetCollection200ResponseHydraSearch
///
/// Properties:
/// * [atType]
/// * [hydraColonTemplate]
/// * [hydraColonVariableRepresentation]
/// * [hydraColonMapping]
@BuiltValue()
abstract class ApiBouldersGetCollection200ResponseHydraSearch
    implements
        Built<ApiBouldersGetCollection200ResponseHydraSearch,
            ApiBouldersGetCollection200ResponseHydraSearchBuilder> {
  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'hydra:template')
  String? get hydraColonTemplate;

  @BuiltValueField(wireName: r'hydra:variableRepresentation')
  String? get hydraColonVariableRepresentation;

  @BuiltValueField(wireName: r'hydra:mapping')
  BuiltList<ApiBouldersGetCollection200ResponseHydraSearchHydraMappingInner>?
      get hydraColonMapping;

  ApiBouldersGetCollection200ResponseHydraSearch._();

  factory ApiBouldersGetCollection200ResponseHydraSearch(
          [void updates(
              ApiBouldersGetCollection200ResponseHydraSearchBuilder b)]) =
      _$ApiBouldersGetCollection200ResponseHydraSearch;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(
          ApiBouldersGetCollection200ResponseHydraSearchBuilder b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiBouldersGetCollection200ResponseHydraSearch>
      get serializer =>
          _$ApiBouldersGetCollection200ResponseHydraSearchSerializer();
}

class _$ApiBouldersGetCollection200ResponseHydraSearchSerializer
    implements
        PrimitiveSerializer<ApiBouldersGetCollection200ResponseHydraSearch> {
  @override
  final Iterable<Type> types = const [
    ApiBouldersGetCollection200ResponseHydraSearch,
    _$ApiBouldersGetCollection200ResponseHydraSearch
  ];

  @override
  final String wireName = r'ApiBouldersGetCollection200ResponseHydraSearch';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiBouldersGetCollection200ResponseHydraSearch object, {
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
              ApiBouldersGetCollection200ResponseHydraSearchHydraMappingInner)
        ]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ApiBouldersGetCollection200ResponseHydraSearch object, {
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
    required ApiBouldersGetCollection200ResponseHydraSearchBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'@type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.atType = valueDes;
          break;
        case r'hydra:template':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.hydraColonTemplate = valueDes;
          break;
        case r'hydra:variableRepresentation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.hydraColonVariableRepresentation = valueDes;
          break;
        case r'hydra:mapping':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [
              FullType(
                  ApiBouldersGetCollection200ResponseHydraSearchHydraMappingInner)
            ]),
          ) as BuiltList<
              ApiBouldersGetCollection200ResponseHydraSearchHydraMappingInner>;
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
  ApiBouldersGetCollection200ResponseHydraSearch deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiBouldersGetCollection200ResponseHydraSearchBuilder();
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
