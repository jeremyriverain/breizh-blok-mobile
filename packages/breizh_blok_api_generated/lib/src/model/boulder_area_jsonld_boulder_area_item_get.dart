//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/geo_point_jsonld_boulder_area_item_get.dart';
import 'package:breizh_blok_api_generated/src/model/boulder_jsonld_boulder_item_get_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_area_jsonld_boulder_area_item_get.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [centroid]
/// * [parkingLocation]
/// * [numberOfBouldersGroupedByGrade]
@BuiltValue()
abstract class BoulderAreaJsonldBoulderAreaItemGet
    implements
        Built<BoulderAreaJsonldBoulderAreaItemGet,
            BoulderAreaJsonldBoulderAreaItemGetBuilder> {
  @BuiltValueField(wireName: r'@context')
  BoulderJsonldBoulderItemGetContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'centroid')
  GeoPointJsonldBoulderAreaItemGet? get centroid;

  @BuiltValueField(wireName: r'parkingLocation')
  GeoPointJsonldBoulderAreaItemGet? get parkingLocation;

  @BuiltValueField(wireName: r'numberOfBouldersGroupedByGrade')
  BuiltMap<String, int>? get numberOfBouldersGroupedByGrade;

  BoulderAreaJsonldBoulderAreaItemGet._();

  factory BoulderAreaJsonldBoulderAreaItemGet(
          [void updates(BoulderAreaJsonldBoulderAreaItemGetBuilder b)]) =
      _$BoulderAreaJsonldBoulderAreaItemGet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderAreaJsonldBoulderAreaItemGetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderAreaJsonldBoulderAreaItemGet> get serializer =>
      _$BoulderAreaJsonldBoulderAreaItemGetSerializer();
}

class _$BoulderAreaJsonldBoulderAreaItemGetSerializer
    implements PrimitiveSerializer<BoulderAreaJsonldBoulderAreaItemGet> {
  @override
  final Iterable<Type> types = const [
    BoulderAreaJsonldBoulderAreaItemGet,
    _$BoulderAreaJsonldBoulderAreaItemGet
  ];

  @override
  final String wireName = r'BoulderAreaJsonldBoulderAreaItemGet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderAreaJsonldBoulderAreaItemGet object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(BoulderJsonldBoulderItemGetContext),
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
        specifiedType:
            const FullType.nullable(GeoPointJsonldBoulderAreaItemGet),
      );
    }
    if (object.parkingLocation != null) {
      yield r'parkingLocation';
      yield serializers.serialize(
        object.parkingLocation,
        specifiedType:
            const FullType.nullable(GeoPointJsonldBoulderAreaItemGet),
      );
    }
    if (object.numberOfBouldersGroupedByGrade != null) {
      yield r'numberOfBouldersGroupedByGrade';
      yield serializers.serialize(
        object.numberOfBouldersGroupedByGrade,
        specifiedType:
            const FullType(BuiltMap, [FullType(String), FullType(int)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderAreaJsonldBoulderAreaItemGet object, {
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
    required BoulderAreaJsonldBoulderAreaItemGetBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'@context':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BoulderJsonldBoulderItemGetContext),
          ) as BoulderJsonldBoulderItemGetContext;
          result.atContext.replace(valueDes);
          break;
        case r'@id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.atId = valueDes;
          break;
        case r'@type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.atType = valueDes;
          break;
        case r'centroid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType.nullable(GeoPointJsonldBoulderAreaItemGet),
          ) as GeoPointJsonldBoulderAreaItemGet?;
          if (valueDes == null) continue;
          result.centroid.replace(valueDes);
          break;
        case r'parkingLocation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType.nullable(GeoPointJsonldBoulderAreaItemGet),
          ) as GeoPointJsonldBoulderAreaItemGet?;
          if (valueDes == null) continue;
          result.parkingLocation.replace(valueDes);
          break;
        case r'numberOfBouldersGroupedByGrade':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltMap, [FullType(String), FullType(int)]),
          ) as BuiltMap<String, int>;
          result.numberOfBouldersGroupedByGrade.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderAreaJsonldBoulderAreaItemGet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderAreaJsonldBoulderAreaItemGetBuilder();
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
