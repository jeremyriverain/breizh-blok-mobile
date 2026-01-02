//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_zero_user_read_boulder_feedback_read.g.dart';

///
///
/// Properties:
/// * [id]
@BuiltValue()
abstract class AuthZeroUserReadBoulderFeedbackRead
    implements
        Built<
          AuthZeroUserReadBoulderFeedbackRead,
          AuthZeroUserReadBoulderFeedbackReadBuilder
        > {
  @BuiltValueField(wireName: r'id')
  String? get id;

  AuthZeroUserReadBoulderFeedbackRead._();

  factory AuthZeroUserReadBoulderFeedbackRead([
    void updates(AuthZeroUserReadBoulderFeedbackReadBuilder b),
  ]) = _$AuthZeroUserReadBoulderFeedbackRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthZeroUserReadBoulderFeedbackReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthZeroUserReadBoulderFeedbackRead> get serializer =>
      _$AuthZeroUserReadBoulderFeedbackReadSerializer();
}

class _$AuthZeroUserReadBoulderFeedbackReadSerializer
    implements PrimitiveSerializer<AuthZeroUserReadBoulderFeedbackRead> {
  @override
  final Iterable<Type> types = const [
    AuthZeroUserReadBoulderFeedbackRead,
    _$AuthZeroUserReadBoulderFeedbackRead,
  ];

  @override
  final String wireName = r'AuthZeroUserReadBoulderFeedbackRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthZeroUserReadBoulderFeedbackRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    AuthZeroUserReadBoulderFeedbackRead object, {
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
    required AuthZeroUserReadBoulderFeedbackReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  AuthZeroUserReadBoulderFeedbackRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthZeroUserReadBoulderFeedbackReadBuilder();
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
