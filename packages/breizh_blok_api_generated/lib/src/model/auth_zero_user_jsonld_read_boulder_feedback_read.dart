//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/auth_zero_user_jsonld_auth_zero_user_read_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_zero_user_jsonld_read_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [id]
@BuiltValue()
abstract class AuthZeroUserJsonldReadBoulderFeedbackRead
    implements
        Built<
          AuthZeroUserJsonldReadBoulderFeedbackRead,
          AuthZeroUserJsonldReadBoulderFeedbackReadBuilder
        > {
  @BuiltValueField(wireName: r'@context')
  AuthZeroUserJsonldAuthZeroUserReadContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'id')
  String? get id;

  AuthZeroUserJsonldReadBoulderFeedbackRead._();

  factory AuthZeroUserJsonldReadBoulderFeedbackRead([
    void updates(AuthZeroUserJsonldReadBoulderFeedbackReadBuilder b),
  ]) = _$AuthZeroUserJsonldReadBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthZeroUserJsonldReadBoulderFeedbackReadBuilder b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthZeroUserJsonldReadBoulderFeedbackRead> get serializer =>
      _$AuthZeroUserJsonldReadBoulderFeedbackReadSerializer();
}

class _$AuthZeroUserJsonldReadBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<AuthZeroUserJsonldReadBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    AuthZeroUserJsonldReadBoulderFeedbackRead,
    _$AuthZeroUserJsonldReadBoulderFeedbackRead,
  ];

  @override
  final String wireName = r'AuthZeroUserJsonldReadBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthZeroUserJsonldReadBoulderFeedbackRead object, {
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
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AuthZeroUserJsonldReadBoulderFeedbackRead object, {
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
    required AuthZeroUserJsonldReadBoulderFeedbackReadBuilder result,
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
        case r'id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.id = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AuthZeroUserJsonldReadBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthZeroUserJsonldReadBoulderFeedbackReadBuilder();
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
