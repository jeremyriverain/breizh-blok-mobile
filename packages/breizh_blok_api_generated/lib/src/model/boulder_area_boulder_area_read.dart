//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/municipality_boulder_area_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_area_boulder_area_read.g.dart';

///
///
/// Properties:
/// * [name]
/// * [description]
/// * [municipality]
@BuiltValue()
abstract class BoulderAreaBoulderAreaRead
    implements
        Built<BoulderAreaBoulderAreaRead, BoulderAreaBoulderAreaReadBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'municipality')
  MunicipalityBoulderAreaRead get municipality;

  BoulderAreaBoulderAreaRead._();

  factory BoulderAreaBoulderAreaRead(
          [void updates(BoulderAreaBoulderAreaReadBuilder b)]) =
      _$BoulderAreaBoulderAreaRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderAreaBoulderAreaReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderAreaBoulderAreaRead> get serializer =>
      _$BoulderAreaBoulderAreaReadSerializer();
}

class _$BoulderAreaBoulderAreaReadSerializer
    implements PrimitiveSerializer<BoulderAreaBoulderAreaRead> {
  @override
  final Iterable<Type> types = const [
    BoulderAreaBoulderAreaRead,
    _$BoulderAreaBoulderAreaRead
  ];

  @override
  final String wireName = r'BoulderAreaBoulderAreaRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderAreaBoulderAreaRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
      specifiedType: const FullType(MunicipalityBoulderAreaRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderAreaBoulderAreaRead object, {
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
    required BoulderAreaBoulderAreaReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
            specifiedType: const FullType(MunicipalityBoulderAreaRead),
          ) as MunicipalityBoulderAreaRead;
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
  BoulderAreaBoulderAreaRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderAreaBoulderAreaReadBuilder();
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
