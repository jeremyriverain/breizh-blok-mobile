//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_area_municipality_read.g.dart';

/// BoulderAreaMunicipalityRead
///
/// Properties:
/// * [name]
@BuiltValue()
abstract class BoulderAreaMunicipalityRead
    implements
        Built<BoulderAreaMunicipalityRead, BoulderAreaMunicipalityReadBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  BoulderAreaMunicipalityRead._();

  factory BoulderAreaMunicipalityRead([
    void updates(BoulderAreaMunicipalityReadBuilder b),
  ]) = _$BoulderAreaMunicipalityRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderAreaMunicipalityReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderAreaMunicipalityRead> get serializer =>
      _$BoulderAreaMunicipalityReadSerializer();
}

class _$BoulderAreaMunicipalityReadSerializer
    implements PrimitiveSerializer<BoulderAreaMunicipalityRead> {
  @override
  final Iterable<Type> types = const [
    BoulderAreaMunicipalityRead,
    _$BoulderAreaMunicipalityRead,
  ];

  @override
  final String wireName = r'BoulderAreaMunicipalityRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderAreaMunicipalityRead object, {
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
    BoulderAreaMunicipalityRead object, {
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
    required BoulderAreaMunicipalityReadBuilder result,
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
  BoulderAreaMunicipalityRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderAreaMunicipalityReadBuilder();
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
