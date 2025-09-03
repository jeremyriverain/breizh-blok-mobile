//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/boulder_jsonld_boulder_item_get_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'height_boulder_jsonld_boulder_item_get.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [min]
/// * [max]
@BuiltValue()
abstract class HeightBoulderJsonldBoulderItemGet
    implements
        Built<
          HeightBoulderJsonldBoulderItemGet,
          HeightBoulderJsonldBoulderItemGetBuilder
        > {
  @BuiltValueField(wireName: r'@context')
  BoulderJsonldBoulderItemGetContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'min')
  int get min;

  @BuiltValueField(wireName: r'max')
  int? get max;

  HeightBoulderJsonldBoulderItemGet._();

  factory HeightBoulderJsonldBoulderItemGet([
    void updates(HeightBoulderJsonldBoulderItemGetBuilder b),
  ]) = _$HeightBoulderJsonldBoulderItemGet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HeightBoulderJsonldBoulderItemGetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HeightBoulderJsonldBoulderItemGet> get serializer =>
      _$HeightBoulderJsonldBoulderItemGetSerializer();
}

class _$HeightBoulderJsonldBoulderItemGetSerializer
    implements PrimitiveSerializer<HeightBoulderJsonldBoulderItemGet> {
  @override
  final Iterable<Type> types = const [
    HeightBoulderJsonldBoulderItemGet,
    _$HeightBoulderJsonldBoulderItemGet,
  ];

  @override
  final String wireName = r'HeightBoulderJsonldBoulderItemGet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HeightBoulderJsonldBoulderItemGet object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(BoulderJsonldBoulderItemGetContext),
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
    yield r'min';
    yield serializers.serialize(object.min, specifiedType: const FullType(int));
    if (object.max != null) {
      yield r'max';
      yield serializers.serialize(
        object.max,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    HeightBoulderJsonldBoulderItemGet object, {
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
    required HeightBoulderJsonldBoulderItemGetBuilder result,
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
                      BoulderJsonldBoulderItemGetContext,
                    ),
                  )
                  as BoulderJsonldBoulderItemGetContext;
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
        case r'min':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.min = valueDes;
          break;
        case r'max':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(int),
                  )
                  as int?;
          if (valueDes == null) continue;
          result.max = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HeightBoulderJsonldBoulderItemGet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HeightBoulderJsonldBoulderItemGetBuilder();
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
