//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'municipality_boulder_read.g.dart';

///
///
/// Properties:
/// * [name]
@BuiltValue()
abstract class MunicipalityBoulderRead
    implements Built<MunicipalityBoulderRead, MunicipalityBoulderReadBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  MunicipalityBoulderRead._();

  factory MunicipalityBoulderRead([
    void updates(MunicipalityBoulderReadBuilder b),
  ]) = _$MunicipalityBoulderRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MunicipalityBoulderReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MunicipalityBoulderRead> get serializer =>
      _$MunicipalityBoulderReadSerializer();
}

class _$MunicipalityBoulderReadSerializer
    implements PrimitiveSerializer<MunicipalityBoulderRead> {
  @override
  final Iterable<Type> types = const [
    MunicipalityBoulderRead,
    _$MunicipalityBoulderRead,
  ];

  @override
  final String wireName = r'MunicipalityBoulderRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MunicipalityBoulderRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MunicipalityBoulderRead object, {
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
    required MunicipalityBoulderReadBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MunicipalityBoulderRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MunicipalityBoulderReadBuilder();
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
