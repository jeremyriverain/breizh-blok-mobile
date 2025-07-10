//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/rock_boulder_feedback_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [name]
/// * [rock]
@BuiltValue()
abstract class BoulderBoulderFeedbackRead
    implements
        Built<BoulderBoulderFeedbackRead, BoulderBoulderFeedbackReadBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'rock')
  RockBoulderFeedbackRead get rock;

  BoulderBoulderFeedbackRead._();

  factory BoulderBoulderFeedbackRead(
          [void updates(BoulderBoulderFeedbackReadBuilder b)]) =
      _$BoulderBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderBoulderFeedbackRead> get serializer =>
      _$BoulderBoulderFeedbackReadSerializer();
}

class _$BoulderBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<BoulderBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    BoulderBoulderFeedbackRead,
    _$BoulderBoulderFeedbackRead
  ];

  @override
  final String wireName = r'BoulderBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderBoulderFeedbackRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'rock';
    yield serializers.serialize(
      object.rock,
      specifiedType: const FullType(RockBoulderFeedbackRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderBoulderFeedbackRead object, {
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
    required BoulderBoulderFeedbackReadBuilder result,
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
        case r'rock':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RockBoulderFeedbackRead),
          ) as RockBoulderFeedbackRead;
          result.rock.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderBoulderFeedbackReadBuilder();
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
