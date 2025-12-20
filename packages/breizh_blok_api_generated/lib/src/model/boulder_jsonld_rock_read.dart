//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/auth_zero_user_jsonld_auth_zero_user_read_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_jsonld_rock_read.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [name]
@BuiltValue()
abstract class BoulderJsonldRockRead
    implements Built<BoulderJsonldRockRead, BoulderJsonldRockReadBuilder> {
  @BuiltValueField(wireName: r'@context')
  AuthZeroUserJsonldAuthZeroUserReadContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'name')
  String get name;

  BoulderJsonldRockRead._();

  factory BoulderJsonldRockRead([
    void updates(BoulderJsonldRockReadBuilder b),
  ]) = _$BoulderJsonldRockRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderJsonldRockReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderJsonldRockRead> get serializer =>
      _$BoulderJsonldRockReadSerializer();
}

class _$BoulderJsonldRockReadSerializer
    implements PrimitiveSerializer<BoulderJsonldRockRead> {
  @override
  final Iterable<Type> types = const [
    BoulderJsonldRockRead,
    _$BoulderJsonldRockRead,
  ];

  @override
  final String wireName = r'BoulderJsonldRockRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderJsonldRockRead object, {
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
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderJsonldRockRead object, {
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
    required BoulderJsonldRockReadBuilder result,
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
  BoulderJsonldRockRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderJsonldRockReadBuilder();
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
