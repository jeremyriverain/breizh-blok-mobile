//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'constraint_violation_violations_inner.g.dart';

/// ConstraintViolationViolationsInner
///
/// Properties:
/// * [propertyPath] - The property path of the violation
/// * [message] - The message associated with the violation
@BuiltValue()
abstract class ConstraintViolationViolationsInner
    implements
        Built<
          ConstraintViolationViolationsInner,
          ConstraintViolationViolationsInnerBuilder
        > {
  /// The property path of the violation
  @BuiltValueField(wireName: r'propertyPath')
  String? get propertyPath;

  /// The message associated with the violation
  @BuiltValueField(wireName: r'message')
  String? get message;

  ConstraintViolationViolationsInner._();

  factory ConstraintViolationViolationsInner([
    void updates(ConstraintViolationViolationsInnerBuilder b),
  ]) = _$ConstraintViolationViolationsInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConstraintViolationViolationsInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConstraintViolationViolationsInner> get serializer =>
      _$ConstraintViolationViolationsInnerSerializer();
}

class _$ConstraintViolationViolationsInnerSerializer
    implements PrimitiveSerializer<ConstraintViolationViolationsInner> {
  @override
  final Iterable<Type> types = const [
    ConstraintViolationViolationsInner,
    _$ConstraintViolationViolationsInner,
  ];

  @override
  final String wireName = r'ConstraintViolationViolationsInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConstraintViolationViolationsInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.propertyPath != null) {
      yield r'propertyPath';
      yield serializers.serialize(
        object.propertyPath,
        specifiedType: const FullType(String),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConstraintViolationViolationsInner object, {
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
    required ConstraintViolationViolationsInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'propertyPath':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.propertyPath = valueDes;
          break;
        case r'message':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConstraintViolationViolationsInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConstraintViolationViolationsInnerBuilder();
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
