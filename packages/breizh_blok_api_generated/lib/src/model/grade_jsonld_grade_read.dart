//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/auth_zero_user_jsonld_auth_zero_user_read_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'grade_jsonld_grade_read.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
@BuiltValue()
abstract class GradeJsonldGradeRead
    implements Built<GradeJsonldGradeRead, GradeJsonldGradeReadBuilder> {
  @BuiltValueField(wireName: r'@context')
  AuthZeroUserJsonldAuthZeroUserReadContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  GradeJsonldGradeRead._();

  factory GradeJsonldGradeRead([void updates(GradeJsonldGradeReadBuilder b)]) =
      _$GradeJsonldGradeRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GradeJsonldGradeReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GradeJsonldGradeRead> get serializer =>
      _$GradeJsonldGradeReadSerializer();
}

class _$GradeJsonldGradeReadSerializer
    implements PrimitiveSerializer<GradeJsonldGradeRead> {
  @override
  final Iterable<Type> types = const [
    GradeJsonldGradeRead,
    _$GradeJsonldGradeRead,
  ];

  @override
  final String wireName = r'GradeJsonldGradeRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GradeJsonldGradeRead object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    GradeJsonldGradeRead object, {
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
    required GradeJsonldGradeReadBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GradeJsonldGradeRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GradeJsonldGradeReadBuilder();
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
