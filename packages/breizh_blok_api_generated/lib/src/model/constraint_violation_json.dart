//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/constraint_violation_json_violations_inner.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'constraint_violation_json.g.dart';

/// Unprocessable entity
///
/// Properties:
/// * [status]
/// * [violations]
/// * [detail]
/// * [type]
/// * [title]
/// * [instance]
@BuiltValue()
abstract class ConstraintViolationJson
    implements Built<ConstraintViolationJson, ConstraintViolationJsonBuilder> {
  @BuiltValueField(wireName: r'status')
  int? get status;

  @BuiltValueField(wireName: r'violations')
  BuiltList<ConstraintViolationJsonViolationsInner>? get violations;

  @BuiltValueField(wireName: r'detail')
  String? get detail;

  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'instance')
  String? get instance;

  ConstraintViolationJson._();

  factory ConstraintViolationJson(
          [void updates(ConstraintViolationJsonBuilder b)]) =
      _$ConstraintViolationJson;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConstraintViolationJsonBuilder b) => b..status = 422;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConstraintViolationJson> get serializer =>
      _$ConstraintViolationJsonSerializer();
}

class _$ConstraintViolationJsonSerializer
    implements PrimitiveSerializer<ConstraintViolationJson> {
  @override
  final Iterable<Type> types = const [
    ConstraintViolationJson,
    _$ConstraintViolationJson
  ];

  @override
  final String wireName = r'ConstraintViolationJson';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConstraintViolationJson object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(int),
      );
    }
    if (object.violations != null) {
      yield r'violations';
      yield serializers.serialize(
        object.violations,
        specifiedType: const FullType(
            BuiltList, [FullType(ConstraintViolationJsonViolationsInner)]),
      );
    }
    if (object.detail != null) {
      yield r'detail';
      yield serializers.serialize(
        object.detail,
        specifiedType: const FullType(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(String),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.instance != null) {
      yield r'instance';
      yield serializers.serialize(
        object.instance,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ConstraintViolationJson object, {
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
    required ConstraintViolationJsonBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.status = valueDes;
          break;
        case r'violations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(ConstraintViolationJsonViolationsInner)]),
          ) as BuiltList<ConstraintViolationJsonViolationsInner>;
          result.violations.replace(valueDes);
          break;
        case r'detail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.detail = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.title = valueDes;
          break;
        case r'instance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.instance = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConstraintViolationJson deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConstraintViolationJsonBuilder();
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
