//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_area_boulder_area_item_get.g.dart';

///
///
/// Properties:
/// * [centroid] -
/// * [parkingLocation] -
/// * [numberOfBouldersGroupedByGrade]
@BuiltValue()
abstract class BoulderAreaBoulderAreaItemGet
    implements
        Built<
          BoulderAreaBoulderAreaItemGet,
          BoulderAreaBoulderAreaItemGetBuilder
        > {
  ///
  @BuiltValueField(wireName: r'centroid')
  JsonObject? get centroid;

  ///
  @BuiltValueField(wireName: r'parkingLocation')
  JsonObject? get parkingLocation;

  @BuiltValueField(wireName: r'numberOfBouldersGroupedByGrade')
  BuiltMap<String, String>? get numberOfBouldersGroupedByGrade;

  BoulderAreaBoulderAreaItemGet._();

  factory BoulderAreaBoulderAreaItemGet([
    void updates(BoulderAreaBoulderAreaItemGetBuilder b),
  ]) = _$BoulderAreaBoulderAreaItemGet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderAreaBoulderAreaItemGetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderAreaBoulderAreaItemGet> get serializer =>
      _$BoulderAreaBoulderAreaItemGetSerializer();
}

class _$BoulderAreaBoulderAreaItemGetSerializer
    implements PrimitiveSerializer<BoulderAreaBoulderAreaItemGet> {
  @override
  final Iterable<Type> types = const [
    BoulderAreaBoulderAreaItemGet,
    _$BoulderAreaBoulderAreaItemGet,
  ];

  @override
  final String wireName = r'BoulderAreaBoulderAreaItemGet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderAreaBoulderAreaItemGet object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.centroid != null) {
      yield r'centroid';
      yield serializers.serialize(
        object.centroid,
        specifiedType: const FullType(JsonObject),
      );
    }
    if (object.parkingLocation != null) {
      yield r'parkingLocation';
      yield serializers.serialize(
        object.parkingLocation,
        specifiedType: const FullType(JsonObject),
      );
    }
    if (object.numberOfBouldersGroupedByGrade != null) {
      yield r'numberOfBouldersGroupedByGrade';
      yield serializers.serialize(
        object.numberOfBouldersGroupedByGrade,
        specifiedType: const FullType(BuiltMap, [
          FullType(String),
          FullType(String),
        ]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderAreaBoulderAreaItemGet object, {
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
    required BoulderAreaBoulderAreaItemGetBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'centroid':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(JsonObject),
                  )
                  as JsonObject;
          result.centroid = valueDes;
          break;
        case r'parkingLocation':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(JsonObject),
                  )
                  as JsonObject;
          result.parkingLocation = valueDes;
          break;
        case r'numberOfBouldersGroupedByGrade':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltMap, [
                      FullType(String),
                      FullType(String),
                    ]),
                  )
                  as BuiltMap<String, String>;
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
  BoulderAreaBoulderAreaItemGet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderAreaBoulderAreaItemGetBuilder();
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
