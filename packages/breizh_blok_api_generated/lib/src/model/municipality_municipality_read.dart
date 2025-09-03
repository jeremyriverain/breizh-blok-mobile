//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/boulder_area_municipality_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'municipality_municipality_read.g.dart';

///
///
/// Properties:
/// * [name]
/// * [boulderAreas]
@BuiltValue()
abstract class MunicipalityMunicipalityRead
    implements
        Built<
          MunicipalityMunicipalityRead,
          MunicipalityMunicipalityReadBuilder
        > {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'boulderAreas')
  BuiltList<BoulderAreaMunicipalityRead>? get boulderAreas;

  MunicipalityMunicipalityRead._();

  factory MunicipalityMunicipalityRead([
    void updates(MunicipalityMunicipalityReadBuilder b),
  ]) = _$MunicipalityMunicipalityRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MunicipalityMunicipalityReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MunicipalityMunicipalityRead> get serializer =>
      _$MunicipalityMunicipalityReadSerializer();
}

class _$MunicipalityMunicipalityReadSerializer
    implements PrimitiveSerializer<MunicipalityMunicipalityRead> {
  @override
  final Iterable<Type> types = const [
    MunicipalityMunicipalityRead,
    _$MunicipalityMunicipalityRead,
  ];

  @override
  final String wireName = r'MunicipalityMunicipalityRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MunicipalityMunicipalityRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.boulderAreas != null) {
      yield r'boulderAreas';
      yield serializers.serialize(
        object.boulderAreas,
        specifiedType: const FullType(BuiltList, [
          FullType(BoulderAreaMunicipalityRead),
        ]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MunicipalityMunicipalityRead object, {
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
    required MunicipalityMunicipalityReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.name = valueDes;
          break;
        case r'boulderAreas':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(BoulderAreaMunicipalityRead),
                    ]),
                  )
                  as BuiltList<BoulderAreaMunicipalityRead>;
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
  MunicipalityMunicipalityRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MunicipalityMunicipalityReadBuilder();
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
