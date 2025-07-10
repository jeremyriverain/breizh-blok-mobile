//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/boulder_feedback_jsonld_boulder_feedback_read.dart';
import 'package:breizh_blok_api_generated/src/model/api_boulders_get_collection200_response_hydra_search.dart';
import 'package:breizh_blok_api_generated/src/model/api_boulders_get_collection200_response_hydra_view.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_boulder_feedbacks_get_collection200_response.g.dart';

/// ApiBoulderFeedbacksGetCollection200Response
///
/// Properties:
/// * [hydraColonMember]
/// * [hydraColonTotalItems]
/// * [hydraColonView]
/// * [hydraColonSearch]
@BuiltValue()
abstract class ApiBoulderFeedbacksGetCollection200Response
    implements
        Built<ApiBoulderFeedbacksGetCollection200Response,
            ApiBoulderFeedbacksGetCollection200ResponseBuilder> {
  @BuiltValueField(wireName: r'hydra:member')
  BuiltList<BoulderFeedbackJsonldBoulderFeedbackRead> get hydraColonMember;

  @BuiltValueField(wireName: r'hydra:totalItems')
  int? get hydraColonTotalItems;

  @BuiltValueField(wireName: r'hydra:view')
  ApiBouldersGetCollection200ResponseHydraView? get hydraColonView;

  @BuiltValueField(wireName: r'hydra:search')
  ApiBouldersGetCollection200ResponseHydraSearch? get hydraColonSearch;

  ApiBoulderFeedbacksGetCollection200Response._();

  factory ApiBoulderFeedbacksGetCollection200Response(
          [void updates(
              ApiBoulderFeedbacksGetCollection200ResponseBuilder b)]) =
      _$ApiBoulderFeedbacksGetCollection200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiBoulderFeedbacksGetCollection200ResponseBuilder b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ApiBoulderFeedbacksGetCollection200Response>
      get serializer =>
          _$ApiBoulderFeedbacksGetCollection200ResponseSerializer();
}

class _$ApiBoulderFeedbacksGetCollection200ResponseSerializer
    implements
        PrimitiveSerializer<ApiBoulderFeedbacksGetCollection200Response> {
  @override
  final Iterable<Type> types = const [
    ApiBoulderFeedbacksGetCollection200Response,
    _$ApiBoulderFeedbacksGetCollection200Response
  ];

  @override
  final String wireName = r'ApiBoulderFeedbacksGetCollection200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ApiBoulderFeedbacksGetCollection200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'hydra:member';
    yield serializers.serialize(
      object.hydraColonMember,
      specifiedType: const FullType(
          BuiltList, [FullType(BoulderFeedbackJsonldBoulderFeedbackRead)]),
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
    ApiBoulderFeedbacksGetCollection200Response object, {
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
    required ApiBoulderFeedbacksGetCollection200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'hydra:member':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList,
                [FullType(BoulderFeedbackJsonldBoulderFeedbackRead)]),
          ) as BuiltList<BoulderFeedbackJsonldBoulderFeedbackRead>;
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
  ApiBoulderFeedbacksGetCollection200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApiBoulderFeedbacksGetCollection200ResponseBuilder();
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
