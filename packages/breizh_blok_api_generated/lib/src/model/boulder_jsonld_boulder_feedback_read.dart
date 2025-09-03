//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/rock_jsonld_boulder_feedback_read.dart';
import 'package:breizh_blok_api_generated/src/model/boulder_jsonld_boulder_item_get_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_jsonld_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [name]
/// * [rock]
@BuiltValue()
abstract class BoulderJsonldBoulderFeedbackRead
    implements
        Built<
          BoulderJsonldBoulderFeedbackRead,
          BoulderJsonldBoulderFeedbackReadBuilder
        > {
  @BuiltValueField(wireName: r'@context')
  BoulderJsonldBoulderItemGetContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'rock')
  RockJsonldBoulderFeedbackRead get rock;

  BoulderJsonldBoulderFeedbackRead._();

  factory BoulderJsonldBoulderFeedbackRead([
    void updates(BoulderJsonldBoulderFeedbackReadBuilder b),
  ]) = _$BoulderJsonldBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderJsonldBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderJsonldBoulderFeedbackRead> get serializer =>
      _$BoulderJsonldBoulderFeedbackReadSerializer();
}

class _$BoulderJsonldBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<BoulderJsonldBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    BoulderJsonldBoulderFeedbackRead,
    _$BoulderJsonldBoulderFeedbackRead,
  ];

  @override
  final String wireName = r'BoulderJsonldBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderJsonldBoulderFeedbackRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(BoulderJsonldBoulderItemGetContext),
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
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'rock';
    yield serializers.serialize(
      object.rock,
      specifiedType: const FullType(RockJsonldBoulderFeedbackRead),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderJsonldBoulderFeedbackRead object, {
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
    required BoulderJsonldBoulderFeedbackReadBuilder result,
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
                      BoulderJsonldBoulderItemGetContext,
                    ),
                  )
                  as BoulderJsonldBoulderItemGetContext;
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
                    specifiedType: const FullType(
                      RockJsonldBoulderFeedbackRead,
                    ),
                  )
                  as RockJsonldBoulderFeedbackRead;
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
  BoulderJsonldBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderJsonldBoulderFeedbackReadBuilder();
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
