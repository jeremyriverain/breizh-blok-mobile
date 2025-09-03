//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_rock_read.g.dart';

///
///
/// Properties:
/// * [name]
@BuiltValue()
abstract class BoulderRockRead
    implements Built<BoulderRockRead, BoulderRockReadBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  BoulderRockRead._();

  factory BoulderRockRead([void updates(BoulderRockReadBuilder b)]) =
      _$BoulderRockRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderRockReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderRockRead> get serializer =>
      _$BoulderRockReadSerializer();
}

class _$BoulderRockReadSerializer
    implements PrimitiveSerializer<BoulderRockRead> {
  @override
  final Iterable<Type> types = const [BoulderRockRead, _$BoulderRockRead];

  @override
  final String wireName = r'BoulderRockRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderRockRead object, {
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
    BoulderRockRead object, {
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
    required BoulderRockReadBuilder result,
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
  BoulderRockRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderRockReadBuilder();
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
