//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/municipality_jsonld_boulder_area_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_area_jsonld_boulder_area_read.g.dart';

///
///
/// Properties:
/// * [atId]
/// * [atType]
/// * [name]
/// * [description]
/// * [municipality]
@BuiltValue()
abstract class BoulderAreaJsonldBoulderAreaRead
    implements
        Built<BoulderAreaJsonldBoulderAreaRead,
            BoulderAreaJsonldBoulderAreaReadBuilder> {
  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'municipality')
  MunicipalityJsonldBoulderAreaRead get municipality;

  BoulderAreaJsonldBoulderAreaRead._();

  factory BoulderAreaJsonldBoulderAreaRead(
          [void updates(BoulderAreaJsonldBoulderAreaReadBuilder b)]) =
      _$BoulderAreaJsonldBoulderAreaRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderAreaJsonldBoulderAreaReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderAreaJsonldBoulderAreaRead> get serializer =>
      _$BoulderAreaJsonldBoulderAreaReadSerializer();
}

class _$BoulderAreaJsonldBoulderAreaReadSerializer
    implements PrimitiveSerializer<BoulderAreaJsonldBoulderAreaRead> {
  @override
  final Iterable<Type> types = const [
    BoulderAreaJsonldBoulderAreaRead,
    _$BoulderAreaJsonldBoulderAreaRead
  ];

  @override
  final String wireName = r'BoulderAreaJsonldBoulderAreaRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderAreaJsonldBoulderAreaRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'municipality';
    yield serializers.serialize(
      object.municipality,
      specifiedType: const FullType(MunicipalityJsonldBoulderAreaRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderAreaJsonldBoulderAreaRead object, {
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
    required BoulderAreaJsonldBoulderAreaReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'municipality':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(MunicipalityJsonldBoulderAreaRead),
          ) as MunicipalityJsonldBoulderAreaRead;
          result.municipality.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderAreaJsonldBoulderAreaRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderAreaJsonldBoulderAreaReadBuilder();
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
