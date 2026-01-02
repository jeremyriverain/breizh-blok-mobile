//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/rock_read_boulder_feedback_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_read_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [name]
/// * [rock]
@BuiltValue()
abstract class BoulderReadBoulderFeedbackRead
    implements
        Built<
          BoulderReadBoulderFeedbackRead,
          BoulderReadBoulderFeedbackReadBuilder
        > {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'rock')
  RockReadBoulderFeedbackRead get rock;

  BoulderReadBoulderFeedbackRead._();

  factory BoulderReadBoulderFeedbackRead([
    void updates(BoulderReadBoulderFeedbackReadBuilder b),
  ]) = _$BoulderReadBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderReadBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderReadBoulderFeedbackRead> get serializer =>
      _$BoulderReadBoulderFeedbackReadSerializer();
}

class _$BoulderReadBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<BoulderReadBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    BoulderReadBoulderFeedbackRead,
    _$BoulderReadBoulderFeedbackRead,
  ];

  @override
  final String wireName = r'BoulderReadBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderReadBoulderFeedbackRead object, {
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
      specifiedType: const FullType(RockReadBoulderFeedbackRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderReadBoulderFeedbackRead object, {
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
    required BoulderReadBoulderFeedbackReadBuilder result,
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
        case r'rock':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(RockReadBoulderFeedbackRead),
                  )
                  as RockReadBoulderFeedbackRead;
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
  BoulderReadBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderReadBoulderFeedbackReadBuilder();
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
