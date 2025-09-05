//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_user_jsonld_boulder_feedback_read_context_one_of.g.dart';

/// AppUserJsonldBoulderFeedbackReadContextOneOf
///
/// Properties:
/// * [atVocab]
/// * [hydra]
@BuiltValue()
abstract class AppUserJsonldBoulderFeedbackReadContextOneOf
    implements
        Built<
          AppUserJsonldBoulderFeedbackReadContextOneOf,
          AppUserJsonldBoulderFeedbackReadContextOneOfBuilder
        > {
  @BuiltValueField(wireName: r'@vocab')
  String get atVocab;

  @BuiltValueField(wireName: r'hydra')
  AppUserJsonldBoulderFeedbackReadContextOneOfHydraEnum get hydra;
  // enum hydraEnum {  http://www.w3.org/ns/hydra/core#,  };

  AppUserJsonldBoulderFeedbackReadContextOneOf._();

  factory AppUserJsonldBoulderFeedbackReadContextOneOf([
    void updates(AppUserJsonldBoulderFeedbackReadContextOneOfBuilder b),
  ]) = _$AppUserJsonldBoulderFeedbackReadContextOneOf;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(
    AppUserJsonldBoulderFeedbackReadContextOneOfBuilder b,
  ) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AppUserJsonldBoulderFeedbackReadContextOneOf>
  get serializer => _$AppUserJsonldBoulderFeedbackReadContextOneOfSerializer();
}

class _$AppUserJsonldBoulderFeedbackReadContextOneOfSerializer
    implements
        PrimitiveSerializer<AppUserJsonldBoulderFeedbackReadContextOneOf> {
  @override
  final Iterable<Type> types = const [
    AppUserJsonldBoulderFeedbackReadContextOneOf,
    _$AppUserJsonldBoulderFeedbackReadContextOneOf,
  ];

  @override
  final String wireName = r'AppUserJsonldBoulderFeedbackReadContextOneOf';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AppUserJsonldBoulderFeedbackReadContextOneOf object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'@vocab';
    yield serializers.serialize(
      object.atVocab,
      specifiedType: const FullType(String),
    );
    yield r'hydra';
    yield serializers.serialize(
      object.hydra,
      specifiedType: const FullType(
        AppUserJsonldBoulderFeedbackReadContextOneOfHydraEnum,
      ),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AppUserJsonldBoulderFeedbackReadContextOneOf object, {
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
    required AppUserJsonldBoulderFeedbackReadContextOneOfBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'@vocab':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.atVocab = valueDes;
          break;
        case r'hydra':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      AppUserJsonldBoulderFeedbackReadContextOneOfHydraEnum,
                    ),
                  )
                  as AppUserJsonldBoulderFeedbackReadContextOneOfHydraEnum;
          result.hydra = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AppUserJsonldBoulderFeedbackReadContextOneOf deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppUserJsonldBoulderFeedbackReadContextOneOfBuilder();
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

class AppUserJsonldBoulderFeedbackReadContextOneOfHydraEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'http://www.w3.org/ns/hydra/core#')
  static const AppUserJsonldBoulderFeedbackReadContextOneOfHydraEnum
  httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash =
      _$appUserJsonldBoulderFeedbackReadContextOneOfHydraEnum_httpColonSlashSlashWwwPeriodW3PeriodOrgSlashNsSlashHydraSlashCoreHash;

  static Serializer<AppUserJsonldBoulderFeedbackReadContextOneOfHydraEnum>
  get serializer =>
      _$appUserJsonldBoulderFeedbackReadContextOneOfHydraEnumSerializer;

  const AppUserJsonldBoulderFeedbackReadContextOneOfHydraEnum._(String name)
    : super(name);

  static BuiltSet<AppUserJsonldBoulderFeedbackReadContextOneOfHydraEnum>
  get values => _$appUserJsonldBoulderFeedbackReadContextOneOfHydraEnumValues;
  static AppUserJsonldBoulderFeedbackReadContextOneOfHydraEnum valueOf(
    String name,
  ) => _$appUserJsonldBoulderFeedbackReadContextOneOfHydraEnumValueOf(name);
}
