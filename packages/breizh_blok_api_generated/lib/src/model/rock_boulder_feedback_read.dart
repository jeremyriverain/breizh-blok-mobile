//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/boulder_area_boulder_feedback_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rock_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [boulderArea]
@BuiltValue()
abstract class RockBoulderFeedbackRead
    implements Built<RockBoulderFeedbackRead, RockBoulderFeedbackReadBuilder> {
  @BuiltValueField(wireName: r'boulderArea')
  BoulderAreaBoulderFeedbackRead get boulderArea;

  RockBoulderFeedbackRead._();

  factory RockBoulderFeedbackRead(
          [void updates(RockBoulderFeedbackReadBuilder b)]) =
      _$RockBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RockBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RockBoulderFeedbackRead> get serializer =>
      _$RockBoulderFeedbackReadSerializer();
}

class _$RockBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<RockBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    RockBoulderFeedbackRead,
    _$RockBoulderFeedbackRead
  ];

  @override
  final String wireName = r'RockBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RockBoulderFeedbackRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'boulderArea';
    yield serializers.serialize(
      object.boulderArea,
      specifiedType: const FullType(BoulderAreaBoulderFeedbackRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RockBoulderFeedbackRead object, {
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
    required RockBoulderFeedbackReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'boulderArea':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BoulderAreaBoulderFeedbackRead),
          ) as BoulderAreaBoulderFeedbackRead;
          result.boulderArea.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RockBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RockBoulderFeedbackReadBuilder();
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
