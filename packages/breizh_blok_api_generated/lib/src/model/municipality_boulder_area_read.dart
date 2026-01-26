//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'municipality_boulder_area_read.g.dart';

/// MunicipalityBoulderAreaRead
///
/// Properties:
/// * [name]
@BuiltValue()
abstract class MunicipalityBoulderAreaRead
    implements
        Built<MunicipalityBoulderAreaRead, MunicipalityBoulderAreaReadBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  MunicipalityBoulderAreaRead._();

  factory MunicipalityBoulderAreaRead([
    void updates(MunicipalityBoulderAreaReadBuilder b),
  ]) = _$MunicipalityBoulderAreaRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MunicipalityBoulderAreaReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MunicipalityBoulderAreaRead> get serializer =>
      _$MunicipalityBoulderAreaReadSerializer();
}

class _$MunicipalityBoulderAreaReadSerializer
    implements PrimitiveSerializer<MunicipalityBoulderAreaRead> {
  @override
  final Iterable<Type> types = const [
    MunicipalityBoulderAreaRead,
    _$MunicipalityBoulderAreaRead,
  ];

  @override
  final String wireName = r'MunicipalityBoulderAreaRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MunicipalityBoulderAreaRead object, {
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
    MunicipalityBoulderAreaRead object, {
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
    required MunicipalityBoulderAreaReadBuilder result,
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
  MunicipalityBoulderAreaRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MunicipalityBoulderAreaReadBuilder();
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
