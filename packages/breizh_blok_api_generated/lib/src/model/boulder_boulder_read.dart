//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/line_boulder_boulder_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/rock_boulder_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_boulder_read.g.dart';

///
///
/// Properties:
/// * [name]
/// * [grade]
/// * [rock]
/// * [lineBoulders]
/// * [isUrban]
@BuiltValue()
abstract class BoulderBoulderRead
    implements Built<BoulderBoulderRead, BoulderBoulderReadBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'grade')
  String? get grade;

  @BuiltValueField(wireName: r'rock')
  RockBoulderRead get rock;

  @BuiltValueField(wireName: r'lineBoulders')
  BuiltList<LineBoulderBoulderRead>? get lineBoulders;

  @BuiltValueField(wireName: r'isUrban')
  bool? get isUrban;

  BoulderBoulderRead._();

  factory BoulderBoulderRead([void updates(BoulderBoulderReadBuilder b)]) =
      _$BoulderBoulderRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderBoulderReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderBoulderRead> get serializer =>
      _$BoulderBoulderReadSerializer();
}

class _$BoulderBoulderReadSerializer
    implements PrimitiveSerializer<BoulderBoulderRead> {
  @override
  final Iterable<Type> types = const [BoulderBoulderRead, _$BoulderBoulderRead];

  @override
  final String wireName = r'BoulderBoulderRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderBoulderRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
      specifiedType: const FullType(RockBoulderRead),
    );
    if (object.lineBoulders != null) {
      yield r'lineBoulders';
      yield serializers.serialize(
        object.lineBoulders,
        specifiedType:
            const FullType(BuiltList, [FullType(LineBoulderBoulderRead)]),
      );
    }
    if (object.isUrban != null) {
      yield r'isUrban';
      yield serializers.serialize(
        object.isUrban,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderBoulderRead object, {
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
    required BoulderBoulderReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'grade':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.grade = valueDes;
          break;
        case r'rock':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RockBoulderRead),
          ) as RockBoulderRead;
          result.rock.replace(valueDes);
          break;
        case r'lineBoulders':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(LineBoulderBoulderRead)]),
          ) as BuiltList<LineBoulderBoulderRead>;
          result.lineBoulders.replace(valueDes);
          break;
        case r'isUrban':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isUrban = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderBoulderRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderBoulderReadBuilder();
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
