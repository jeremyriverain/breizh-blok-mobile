//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema_context.dart';
import 'package:breizh_blok_api_generated/src/model/rock_jsonld_read_boulder_feedback_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_jsonld_read_boulder_feedback_read.g.dart';

/// BoulderJsonldReadBoulderFeedbackRead
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [name]
/// * [rock]
@BuiltValue()
abstract class BoulderJsonldReadBoulderFeedbackRead
    implements
        HydraItemBaseSchema,
        Built<
          BoulderJsonldReadBoulderFeedbackRead,
          BoulderJsonldReadBoulderFeedbackReadBuilder
        > {
  @BuiltValueField(wireName: r'rock')
  RockJsonldReadBoulderFeedbackRead get rock;

  @BuiltValueField(wireName: r'name')
  String get name;

  BoulderJsonldReadBoulderFeedbackRead._();

  factory BoulderJsonldReadBoulderFeedbackRead([
    void updates(BoulderJsonldReadBoulderFeedbackReadBuilder b),
  ]) = _$BoulderJsonldReadBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderJsonldReadBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderJsonldReadBoulderFeedbackRead> get serializer =>
      _$BoulderJsonldReadBoulderFeedbackReadSerializer();
}

class _$BoulderJsonldReadBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<BoulderJsonldReadBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    BoulderJsonldReadBoulderFeedbackRead,
    _$BoulderJsonldReadBoulderFeedbackRead,
  ];

  @override
  final String wireName = r'BoulderJsonldReadBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderJsonldReadBoulderFeedbackRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'rock';
    yield serializers.serialize(
      object.rock,
      specifiedType: const FullType(RockJsonldReadBoulderFeedbackRead),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(HydraItemBaseSchemaContext),
      );
    }
    yield r'@id';
    yield serializers.serialize(
      object.atId,
      specifiedType: const FullType(String),
    );
    yield r'@type';
    yield serializers.serialize(
      object.atType,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderJsonldReadBoulderFeedbackRead object, {
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
    required BoulderJsonldReadBoulderFeedbackReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'rock':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      RockJsonldReadBoulderFeedbackRead,
                    ),
                  )
                  as RockJsonldReadBoulderFeedbackRead;
          result.rock.replace(valueDes);
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
        case r'@context':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(HydraItemBaseSchemaContext),
                  )
                  as HydraItemBaseSchemaContext;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderJsonldReadBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderJsonldReadBoulderFeedbackReadBuilder();
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
