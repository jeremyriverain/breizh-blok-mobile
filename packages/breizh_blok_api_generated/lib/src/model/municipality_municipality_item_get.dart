//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'municipality_municipality_item_get.g.dart';

/// MunicipalityMunicipalityItemGet
///
/// Properties:
/// * [centroid]
@BuiltValue()
abstract class MunicipalityMunicipalityItemGet
    implements
        Built<
          MunicipalityMunicipalityItemGet,
          MunicipalityMunicipalityItemGetBuilder
        > {
  @BuiltValueField(wireName: r'centroid')
  JsonObject? get centroid;

  MunicipalityMunicipalityItemGet._();

  factory MunicipalityMunicipalityItemGet([
    void updates(MunicipalityMunicipalityItemGetBuilder b),
  ]) = _$MunicipalityMunicipalityItemGet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MunicipalityMunicipalityItemGetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MunicipalityMunicipalityItemGet> get serializer =>
      _$MunicipalityMunicipalityItemGetSerializer();
}

class _$MunicipalityMunicipalityItemGetSerializer
    implements PrimitiveSerializer<MunicipalityMunicipalityItemGet> {
  @override
  final Iterable<Type> types = const [
    MunicipalityMunicipalityItemGet,
    _$MunicipalityMunicipalityItemGet,
  ];

  @override
  final String wireName = r'MunicipalityMunicipalityItemGet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MunicipalityMunicipalityItemGet object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.centroid != null) {
      yield r'centroid';
      yield serializers.serialize(
        object.centroid,
        specifiedType: const FullType(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MunicipalityMunicipalityItemGet object, {
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
    required MunicipalityMunicipalityItemGetBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'centroid':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(JsonObject),
                  )
                  as JsonObject;
          result.centroid = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MunicipalityMunicipalityItemGet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MunicipalityMunicipalityItemGetBuilder();
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
