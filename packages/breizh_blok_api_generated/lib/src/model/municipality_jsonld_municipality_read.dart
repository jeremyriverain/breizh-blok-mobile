//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/boulder_area_jsonld_municipality_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'municipality_jsonld_municipality_read.g.dart';

///
///
/// Properties:
/// * [atId]
/// * [atType]
/// * [name]
/// * [boulderAreas]
@BuiltValue()
abstract class MunicipalityJsonldMunicipalityRead
    implements
        Built<MunicipalityJsonldMunicipalityRead,
            MunicipalityJsonldMunicipalityReadBuilder> {
  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'boulderAreas')
  BuiltList<BoulderAreaJsonldMunicipalityRead>? get boulderAreas;

  MunicipalityJsonldMunicipalityRead._();

  factory MunicipalityJsonldMunicipalityRead(
          [void updates(MunicipalityJsonldMunicipalityReadBuilder b)]) =
      _$MunicipalityJsonldMunicipalityRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MunicipalityJsonldMunicipalityReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MunicipalityJsonldMunicipalityRead> get serializer =>
      _$MunicipalityJsonldMunicipalityReadSerializer();
}

class _$MunicipalityJsonldMunicipalityReadSerializer
    implements PrimitiveSerializer<MunicipalityJsonldMunicipalityRead> {
  @override
  final Iterable<Type> types = const [
    MunicipalityJsonldMunicipalityRead,
    _$MunicipalityJsonldMunicipalityRead
  ];

  @override
  final String wireName = r'MunicipalityJsonldMunicipalityRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MunicipalityJsonldMunicipalityRead object, {
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
    if (object.boulderAreas != null) {
      yield r'boulderAreas';
      yield serializers.serialize(
        object.boulderAreas,
        specifiedType: const FullType(
            BuiltList, [FullType(BoulderAreaJsonldMunicipalityRead)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MunicipalityJsonldMunicipalityRead object, {
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
    required MunicipalityJsonldMunicipalityReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'@id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.atId = valueDes;
          break;
        case r'@type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.atType = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'boulderAreas':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(BoulderAreaJsonldMunicipalityRead)]),
          ) as BuiltList<BoulderAreaJsonldMunicipalityRead>;
          result.boulderAreas.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MunicipalityJsonldMunicipalityRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MunicipalityJsonldMunicipalityReadBuilder();
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
