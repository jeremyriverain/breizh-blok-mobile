//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/app_user_jsonld_boulder_feedback_read_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'municipality_jsonld_boulder_area_read.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [name]
@BuiltValue()
abstract class MunicipalityJsonldBoulderAreaRead
    implements
        Built<
          MunicipalityJsonldBoulderAreaRead,
          MunicipalityJsonldBoulderAreaReadBuilder
        > {
  @BuiltValueField(wireName: r'@context')
  AppUserJsonldBoulderFeedbackReadContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'name')
  String get name;

  MunicipalityJsonldBoulderAreaRead._();

  factory MunicipalityJsonldBoulderAreaRead([
    void updates(MunicipalityJsonldBoulderAreaReadBuilder b),
  ]) = _$MunicipalityJsonldBoulderAreaRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MunicipalityJsonldBoulderAreaReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MunicipalityJsonldBoulderAreaRead> get serializer =>
      _$MunicipalityJsonldBoulderAreaReadSerializer();
}

class _$MunicipalityJsonldBoulderAreaReadSerializer
    implements PrimitiveSerializer<MunicipalityJsonldBoulderAreaRead> {
  @override
  final Iterable<Type> types = const [
    MunicipalityJsonldBoulderAreaRead,
    _$MunicipalityJsonldBoulderAreaRead,
  ];

  @override
  final String wireName = r'MunicipalityJsonldBoulderAreaRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MunicipalityJsonldBoulderAreaRead object, {
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
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MunicipalityJsonldBoulderAreaRead object, {
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
    required MunicipalityJsonldBoulderAreaReadBuilder result,
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
        case r'name':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.name = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MunicipalityJsonldBoulderAreaRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MunicipalityJsonldBoulderAreaReadBuilder();
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
