//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/constraint_violation_json_violations_inner.dart';
import 'package:breizh_blok_api_generated/src/model/app_user_jsonld_boulder_feedback_read_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'constraint_violation_jsonld_jsonld.g.dart';

/// Unprocessable entity
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [status]
/// * [violations]
/// * [detail]
/// * [description]
/// * [type]
/// * [title]
/// * [instance]
@BuiltValue()
abstract class ConstraintViolationJsonldJsonld
    implements
        Built<
          ConstraintViolationJsonldJsonld,
          ConstraintViolationJsonldJsonldBuilder
        > {
  @BuiltValueField(wireName: r'@context')
  AppUserJsonldBoulderFeedbackReadContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'status')
  int? get status;

  @BuiltValueField(wireName: r'violations')
  BuiltList<ConstraintViolationJsonViolationsInner>? get violations;

  @BuiltValueField(wireName: r'detail')
  String? get detail;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'instance')
  String? get instance;

  ConstraintViolationJsonldJsonld._();

  factory ConstraintViolationJsonldJsonld([
    void updates(ConstraintViolationJsonldJsonldBuilder b),
  ]) = _$ConstraintViolationJsonldJsonld;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConstraintViolationJsonldJsonldBuilder b) =>
      b..status = 422;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConstraintViolationJsonldJsonld> get serializer =>
      _$ConstraintViolationJsonldJsonldSerializer();
}

class _$ConstraintViolationJsonldJsonldSerializer
    implements PrimitiveSerializer<ConstraintViolationJsonldJsonld> {
  @override
  final Iterable<Type> types = const [
    ConstraintViolationJsonldJsonld,
    _$ConstraintViolationJsonldJsonld,
  ];

  @override
  final String wireName = r'ConstraintViolationJsonldJsonld';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConstraintViolationJsonldJsonld object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(AppUserJsonldBoulderFeedbackReadContext),
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
        specifiedType: const FullType(BuiltList, [
          FullType(ConstraintViolationJsonViolationsInner),
        ]),
      );
    }
    if (object.detail != null) {
      yield r'detail';
      yield serializers.serialize(
        object.detail,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
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
    ConstraintViolationJsonldJsonld object, {
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
    required ConstraintViolationJsonldJsonldBuilder result,
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
                      AppUserJsonldBoulderFeedbackReadContext,
                    ),
                  )
                  as AppUserJsonldBoulderFeedbackReadContext;
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
        case r'status':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.status = valueDes;
          break;
        case r'violations':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(ConstraintViolationJsonViolationsInner),
                    ]),
                  )
                  as BuiltList<ConstraintViolationJsonViolationsInner>;
          result.violations.replace(valueDes);
          break;
        case r'detail':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.detail = valueDes;
          break;
        case r'description':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.description = valueDes;
          break;
        case r'type':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.type = valueDes;
          break;
        case r'title':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.title = valueDes;
          break;
        case r'instance':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
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
  ConstraintViolationJsonldJsonld deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConstraintViolationJsonldJsonldBuilder();
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
