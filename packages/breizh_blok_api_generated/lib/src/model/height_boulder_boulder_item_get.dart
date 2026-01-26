//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'height_boulder_boulder_item_get.g.dart';

/// HeightBoulderBoulderItemGet
///
/// Properties:
/// * [min]
/// * [max]
@BuiltValue()
abstract class HeightBoulderBoulderItemGet
    implements
        Built<HeightBoulderBoulderItemGet, HeightBoulderBoulderItemGetBuilder> {
  @BuiltValueField(wireName: r'min')
  int get min;

  @BuiltValueField(wireName: r'max')
  int? get max;

  HeightBoulderBoulderItemGet._();

  factory HeightBoulderBoulderItemGet([
    void updates(HeightBoulderBoulderItemGetBuilder b),
  ]) = _$HeightBoulderBoulderItemGet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HeightBoulderBoulderItemGetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HeightBoulderBoulderItemGet> get serializer =>
      _$HeightBoulderBoulderItemGetSerializer();
}

class _$HeightBoulderBoulderItemGetSerializer
    implements PrimitiveSerializer<HeightBoulderBoulderItemGet> {
  @override
  final Iterable<Type> types = const [
    HeightBoulderBoulderItemGet,
    _$HeightBoulderBoulderItemGet,
  ];

  @override
  final String wireName = r'HeightBoulderBoulderItemGet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HeightBoulderBoulderItemGet object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'min';
    yield serializers.serialize(object.min, specifiedType: const FullType(int));
    if (object.max != null) {
      yield r'max';
      yield serializers.serialize(
        object.max,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    HeightBoulderBoulderItemGet object, {
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
    required HeightBoulderBoulderItemGetBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'min':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.min = valueDes;
          break;
        case r'max':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(int),
                  )
                  as int?;
          if (valueDes == null) continue;
          result.max = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HeightBoulderBoulderItemGet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HeightBoulderBoulderItemGetBuilder();
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
