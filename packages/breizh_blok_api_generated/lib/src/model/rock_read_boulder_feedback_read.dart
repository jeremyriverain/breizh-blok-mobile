//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/boulder_area_read_boulder_feedback_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rock_read_boulder_feedback_read.g.dart';

/// RockReadBoulderFeedbackRead
///
/// Properties:
/// * [boulderArea]
@BuiltValue()
abstract class RockReadBoulderFeedbackRead
    implements
        Built<RockReadBoulderFeedbackRead, RockReadBoulderFeedbackReadBuilder> {
  @BuiltValueField(wireName: r'boulderArea')
  BoulderAreaReadBoulderFeedbackRead get boulderArea;

  RockReadBoulderFeedbackRead._();

  factory RockReadBoulderFeedbackRead([
    void updates(RockReadBoulderFeedbackReadBuilder b),
  ]) = _$RockReadBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RockReadBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RockReadBoulderFeedbackRead> get serializer =>
      _$RockReadBoulderFeedbackReadSerializer();
}

class _$RockReadBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<RockReadBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    RockReadBoulderFeedbackRead,
    _$RockReadBoulderFeedbackRead,
  ];

  @override
  final String wireName = r'RockReadBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RockReadBoulderFeedbackRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'boulderArea';
    yield serializers.serialize(
      object.boulderArea,
      specifiedType: const FullType(BoulderAreaReadBoulderFeedbackRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RockReadBoulderFeedbackRead object, {
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
    required RockReadBoulderFeedbackReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'boulderArea':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      BoulderAreaReadBoulderFeedbackRead,
                    ),
                  )
                  as BoulderAreaReadBoulderFeedbackRead;
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
  RockReadBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RockReadBoulderFeedbackReadBuilder();
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
