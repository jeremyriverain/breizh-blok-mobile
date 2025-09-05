//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/geo_point_jsonld_municipality_item_get.dart';
import 'package:breizh_blok_api_generated/src/model/app_user_jsonld_boulder_feedback_read_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'municipality_jsonld_municipality_item_get.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [centroid]
@BuiltValue()
abstract class MunicipalityJsonldMunicipalityItemGet
    implements
        Built<
          MunicipalityJsonldMunicipalityItemGet,
          MunicipalityJsonldMunicipalityItemGetBuilder
        > {
  @BuiltValueField(wireName: r'@context')
  AppUserJsonldBoulderFeedbackReadContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'centroid')
  GeoPointJsonldMunicipalityItemGet? get centroid;

  MunicipalityJsonldMunicipalityItemGet._();

  factory MunicipalityJsonldMunicipalityItemGet([
    void updates(MunicipalityJsonldMunicipalityItemGetBuilder b),
  ]) = _$MunicipalityJsonldMunicipalityItemGet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MunicipalityJsonldMunicipalityItemGetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MunicipalityJsonldMunicipalityItemGet> get serializer =>
      _$MunicipalityJsonldMunicipalityItemGetSerializer();
}

class _$MunicipalityJsonldMunicipalityItemGetSerializer
    implements PrimitiveSerializer<MunicipalityJsonldMunicipalityItemGet> {
  @override
  final Iterable<Type> types = const [
    MunicipalityJsonldMunicipalityItemGet,
    _$MunicipalityJsonldMunicipalityItemGet,
  ];

  @override
  final String wireName = r'MunicipalityJsonldMunicipalityItemGet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MunicipalityJsonldMunicipalityItemGet object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(AppUserJsonldBoulderFeedbackReadContext),
      );
    }
    if (object.atId != null) {
      yield r'@id';
      yield serializers.serialize(
        object.atId,
        specifiedType: const FullType(String),
      );
    }
    if (object.atType != null) {
      yield r'@type';
      yield serializers.serialize(
        object.atType,
        specifiedType: const FullType(String),
      );
    }
    if (object.centroid != null) {
      yield r'centroid';
      yield serializers.serialize(
        object.centroid,
        specifiedType: const FullType.nullable(
          GeoPointJsonldMunicipalityItemGet,
        ),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MunicipalityJsonldMunicipalityItemGet object, {
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
    required MunicipalityJsonldMunicipalityItemGetBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'@context':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      AppUserJsonldBoulderFeedbackReadContext,
                    ),
                  )
                  as AppUserJsonldBoulderFeedbackReadContext;
          result.atContext.replace(valueDes);
          break;
        case r'@id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.atId = valueDes;
          break;
        case r'@type':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.atType = valueDes;
          break;
        case r'centroid':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(
                      GeoPointJsonldMunicipalityItemGet,
                    ),
                  )
                  as GeoPointJsonldMunicipalityItemGet?;
          if (valueDes == null) continue;
          result.centroid.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MunicipalityJsonldMunicipalityItemGet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MunicipalityJsonldMunicipalityItemGetBuilder();
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
