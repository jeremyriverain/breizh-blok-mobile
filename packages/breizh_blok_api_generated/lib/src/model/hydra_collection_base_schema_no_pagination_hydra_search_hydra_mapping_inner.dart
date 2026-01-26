//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'hydra_collection_base_schema_no_pagination_hydra_search_hydra_mapping_inner.g.dart';

/// HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner
///
/// Properties:
/// * [atType]
/// * [variable]
/// * [property]
/// * [required_]
@BuiltValue()
abstract class HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner
    implements
        Built<
          HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner,
          HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInnerBuilder
        > {
  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'variable')
  String? get variable;

  @BuiltValueField(wireName: r'property')
  String? get property;

  @BuiltValueField(wireName: r'required')
  bool? get required_;

  HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner._();

  factory HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner([
    void updates(
      HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInnerBuilder
      b,
    ),
  ]) = _$HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(
    HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInnerBuilder b,
  ) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<
    HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner
  >
  get serializer =>
      _$HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInnerSerializer();
}

class _$HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInnerSerializer
    implements
        PrimitiveSerializer<
          HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner
        > {
  @override
  final Iterable<Type> types = const [
    HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner,
    _$HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner,
  ];

  @override
  final String wireName =
      r'HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.atType != null) {
      yield r'@type';
      yield serializers.serialize(
        object.atType,
        specifiedType: const FullType(String),
      );
    }
    if (object.variable != null) {
      yield r'variable';
      yield serializers.serialize(
        object.variable,
        specifiedType: const FullType(String),
      );
    }
    if (object.property != null) {
      yield r'property';
      yield serializers.serialize(
        object.property,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.required_ != null) {
      yield r'required';
      yield serializers.serialize(
        object.required_,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner object, {
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
    required HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInnerBuilder
    result,
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
        case r'variable':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.variable = valueDes;
          break;
        case r'property':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.property = valueDes;
          break;
        case r'required':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.required_ = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result =
        HydraCollectionBaseSchemaNoPaginationHydraSearchHydraMappingInnerBuilder();
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
