//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'line_boulder_boulder_read.g.dart';

/// LineBoulderBoulderRead
///
/// Properties:
/// * [rockImage]
/// * [smoothLine]
@BuiltValue()
abstract class LineBoulderBoulderRead
    implements Built<LineBoulderBoulderRead, LineBoulderBoulderReadBuilder> {
  @BuiltValueField(wireName: r'rockImage')
  String get rockImage;

  @BuiltValueField(wireName: r'smoothLine')
  String get smoothLine;

  LineBoulderBoulderRead._();

  factory LineBoulderBoulderRead([
    void updates(LineBoulderBoulderReadBuilder b),
  ]) = _$LineBoulderBoulderRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LineBoulderBoulderReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LineBoulderBoulderRead> get serializer =>
      _$LineBoulderBoulderReadSerializer();
}

class _$LineBoulderBoulderReadSerializer
    implements PrimitiveSerializer<LineBoulderBoulderRead> {
  @override
  final Iterable<Type> types = const [
    LineBoulderBoulderRead,
    _$LineBoulderBoulderRead,
  ];

  @override
  final String wireName = r'LineBoulderBoulderRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LineBoulderBoulderRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'rockImage';
    yield serializers.serialize(
      object.rockImage,
      specifiedType: const FullType(String),
    );
    yield r'smoothLine';
    yield serializers.serialize(
      object.smoothLine,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LineBoulderBoulderRead object, {
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
    required LineBoulderBoulderReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'rockImage':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.rockImage = valueDes;
          break;
        case r'smoothLine':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.smoothLine = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LineBoulderBoulderRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LineBoulderBoulderReadBuilder();
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
