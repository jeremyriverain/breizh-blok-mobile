//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_area_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [name]
@BuiltValue()
abstract class BoulderAreaBoulderFeedbackRead
    implements
        Built<BoulderAreaBoulderFeedbackRead,
            BoulderAreaBoulderFeedbackReadBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  BoulderAreaBoulderFeedbackRead._();

  factory BoulderAreaBoulderFeedbackRead(
          [void updates(BoulderAreaBoulderFeedbackReadBuilder b)]) =
      _$BoulderAreaBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderAreaBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderAreaBoulderFeedbackRead> get serializer =>
      _$BoulderAreaBoulderFeedbackReadSerializer();
}

class _$BoulderAreaBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<BoulderAreaBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    BoulderAreaBoulderFeedbackRead,
    _$BoulderAreaBoulderFeedbackRead
  ];

  @override
  final String wireName = r'BoulderAreaBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderAreaBoulderFeedbackRead object, {
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
    BoulderAreaBoulderFeedbackRead object, {
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
    required BoulderAreaBoulderFeedbackReadBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderAreaBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderAreaBoulderFeedbackReadBuilder();
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
