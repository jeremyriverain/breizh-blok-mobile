//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/boulder_area_jsonld_read_boulder_feedback_read.dart';
import 'package:breizh_blok_api_generated/src/model/auth_zero_user_jsonld_auth_zero_user_read_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'rock_jsonld_read_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [boulderArea]
@BuiltValue()
abstract class RockJsonldReadBoulderFeedbackRead
    implements
        Built<
          RockJsonldReadBoulderFeedbackRead,
          RockJsonldReadBoulderFeedbackReadBuilder
        > {
  @BuiltValueField(wireName: r'@context')
  AuthZeroUserJsonldAuthZeroUserReadContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'boulderArea')
  BoulderAreaJsonldReadBoulderFeedbackRead get boulderArea;

  RockJsonldReadBoulderFeedbackRead._();

  factory RockJsonldReadBoulderFeedbackRead([
    void updates(RockJsonldReadBoulderFeedbackReadBuilder b),
  ]) = _$RockJsonldReadBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RockJsonldReadBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RockJsonldReadBoulderFeedbackRead> get serializer =>
      _$RockJsonldReadBoulderFeedbackReadSerializer();
}

class _$RockJsonldReadBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<RockJsonldReadBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    RockJsonldReadBoulderFeedbackRead,
    _$RockJsonldReadBoulderFeedbackRead,
  ];

  @override
  final String wireName = r'RockJsonldReadBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RockJsonldReadBoulderFeedbackRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(
          AuthZeroUserJsonldAuthZeroUserReadContext,
        ),
      );
    }
    if (object.atId != null) {
      yield r'@id';
      yield serializers.serialize(
        object.atId,
        specifiedType: const FullType(String),
      );
    }
    if (object.atType != null) {
      yield r'@type';
      yield serializers.serialize(
        object.atType,
        specifiedType: const FullType(String),
      );
    }
    yield r'boulderArea';
    yield serializers.serialize(
      object.boulderArea,
      specifiedType: const FullType(BoulderAreaJsonldReadBoulderFeedbackRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RockJsonldReadBoulderFeedbackRead object, {
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
    required RockJsonldReadBoulderFeedbackReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'@context':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      AuthZeroUserJsonldAuthZeroUserReadContext,
                    ),
                  )
                  as AuthZeroUserJsonldAuthZeroUserReadContext;
          result.atContext.replace(valueDes);
          break;
        case r'@id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.atId = valueDes;
          break;
        case r'@type':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.atType = valueDes;
          break;
        case r'boulderArea':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      BoulderAreaJsonldReadBoulderFeedbackRead,
                    ),
                  )
                  as BoulderAreaJsonldReadBoulderFeedbackRead;
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
  RockJsonldReadBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RockJsonldReadBoulderFeedbackReadBuilder();
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
