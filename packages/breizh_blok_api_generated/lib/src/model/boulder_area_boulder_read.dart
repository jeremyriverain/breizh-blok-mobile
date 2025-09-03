//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/municipality_boulder_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_area_boulder_read.g.dart';

///
///
/// Properties:
/// * [name]
/// * [municipality]
@BuiltValue()
abstract class BoulderAreaBoulderRead
    implements Built<BoulderAreaBoulderRead, BoulderAreaBoulderReadBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'municipality')
  MunicipalityBoulderRead get municipality;

  BoulderAreaBoulderRead._();

  factory BoulderAreaBoulderRead([
    void updates(BoulderAreaBoulderReadBuilder b),
  ]) = _$BoulderAreaBoulderRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderAreaBoulderReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderAreaBoulderRead> get serializer =>
      _$BoulderAreaBoulderReadSerializer();
}

class _$BoulderAreaBoulderReadSerializer
    implements PrimitiveSerializer<BoulderAreaBoulderRead> {
  @override
  final Iterable<Type> types = const [
    BoulderAreaBoulderRead,
    _$BoulderAreaBoulderRead,
  ];

  @override
  final String wireName = r'BoulderAreaBoulderRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderAreaBoulderRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'municipality';
    yield serializers.serialize(
      object.municipality,
      specifiedType: const FullType(MunicipalityBoulderRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderAreaBoulderRead object, {
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
    required BoulderAreaBoulderReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.name = valueDes;
          break;
        case r'municipality':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(MunicipalityBoulderRead),
                  )
                  as MunicipalityBoulderRead;
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
  BoulderAreaBoulderRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderAreaBoulderReadBuilder();
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
