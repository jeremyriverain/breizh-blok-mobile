//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/line_boulder_jsonld_boulder_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/rock_jsonld_boulder_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_jsonld_boulder_read.g.dart';

///
///
/// Properties:
/// * [atId]
/// * [atType]
/// * [name]
/// * [grade]
/// * [rock]
/// * [lineBoulders]
@BuiltValue()
abstract class BoulderJsonldBoulderRead
    implements
        Built<BoulderJsonldBoulderRead, BoulderJsonldBoulderReadBuilder> {
  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'grade')
  String? get grade;

  @BuiltValueField(wireName: r'rock')
  RockJsonldBoulderRead get rock;

  @BuiltValueField(wireName: r'lineBoulders')
  BuiltList<LineBoulderJsonldBoulderRead>? get lineBoulders;

  BoulderJsonldBoulderRead._();

  factory BoulderJsonldBoulderRead([
    void updates(BoulderJsonldBoulderReadBuilder b),
  ]) = _$BoulderJsonldBoulderRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderJsonldBoulderReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderJsonldBoulderRead> get serializer =>
      _$BoulderJsonldBoulderReadSerializer();
}

class _$BoulderJsonldBoulderReadSerializer
    implements PrimitiveSerializer<BoulderJsonldBoulderRead> {
  @override
  final Iterable<Type> types = const [
    BoulderJsonldBoulderRead,
    _$BoulderJsonldBoulderRead,
  ];

  @override
  final String wireName = r'BoulderJsonldBoulderRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderJsonldBoulderRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    if (object.grade != null) {
      yield r'grade';
      yield serializers.serialize(
        object.grade,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'rock';
    yield serializers.serialize(
      object.rock,
      specifiedType: const FullType(RockJsonldBoulderRead),
    );
    if (object.lineBoulders != null) {
      yield r'lineBoulders';
      yield serializers.serialize(
        object.lineBoulders,
        specifiedType: const FullType(BuiltList, [
          FullType(LineBoulderJsonldBoulderRead),
        ]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderJsonldBoulderRead object, {
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
    required BoulderJsonldBoulderReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'grade':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.grade = valueDes;
          break;
        case r'rock':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(RockJsonldBoulderRead),
                  )
                  as RockJsonldBoulderRead;
          result.rock.replace(valueDes);
          break;
        case r'lineBoulders':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(LineBoulderJsonldBoulderRead),
                    ]),
                  )
                  as BuiltList<LineBoulderJsonldBoulderRead>;
          result.lineBoulders.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderJsonldBoulderRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderJsonldBoulderReadBuilder();
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
