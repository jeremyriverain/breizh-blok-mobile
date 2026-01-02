//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_area_read_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [name]
@BuiltValue()
abstract class BoulderAreaReadBoulderFeedbackRead
    implements
        Built<
          BoulderAreaReadBoulderFeedbackRead,
          BoulderAreaReadBoulderFeedbackReadBuilder
        > {
  @BuiltValueField(wireName: r'name')
  String get name;

  BoulderAreaReadBoulderFeedbackRead._();

  factory BoulderAreaReadBoulderFeedbackRead([
    void updates(BoulderAreaReadBoulderFeedbackReadBuilder b),
  ]) = _$BoulderAreaReadBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderAreaReadBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderAreaReadBoulderFeedbackRead> get serializer =>
      _$BoulderAreaReadBoulderFeedbackReadSerializer();
}

class _$BoulderAreaReadBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<BoulderAreaReadBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    BoulderAreaReadBoulderFeedbackRead,
    _$BoulderAreaReadBoulderFeedbackRead,
  ];

  @override
  final String wireName = r'BoulderAreaReadBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderAreaReadBoulderFeedbackRead object, {
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
    BoulderAreaReadBoulderFeedbackRead object, {
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
    required BoulderAreaReadBoulderFeedbackReadBuilder result,
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
  BoulderAreaReadBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderAreaReadBoulderFeedbackReadBuilder();
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
