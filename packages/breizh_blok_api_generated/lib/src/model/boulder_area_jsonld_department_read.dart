//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/boulder_jsonld_boulder_item_get_context.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_area_jsonld_department_read.g.dart';

///
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [name]
@BuiltValue()
abstract class BoulderAreaJsonldDepartmentRead
    implements
        Built<BoulderAreaJsonldDepartmentRead,
            BoulderAreaJsonldDepartmentReadBuilder> {
  @BuiltValueField(wireName: r'@context')
  BoulderJsonldBoulderItemGetContext? get atContext;

  @BuiltValueField(wireName: r'@id')
  String? get atId;

  @BuiltValueField(wireName: r'@type')
  String? get atType;

  @BuiltValueField(wireName: r'name')
  String get name;

  BoulderAreaJsonldDepartmentRead._();

  factory BoulderAreaJsonldDepartmentRead(
          [void updates(BoulderAreaJsonldDepartmentReadBuilder b)]) =
      _$BoulderAreaJsonldDepartmentRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderAreaJsonldDepartmentReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderAreaJsonldDepartmentRead> get serializer =>
      _$BoulderAreaJsonldDepartmentReadSerializer();
}

class _$BoulderAreaJsonldDepartmentReadSerializer
    implements PrimitiveSerializer<BoulderAreaJsonldDepartmentRead> {
  @override
  final Iterable<Type> types = const [
    BoulderAreaJsonldDepartmentRead,
    _$BoulderAreaJsonldDepartmentRead
  ];

  @override
  final String wireName = r'BoulderAreaJsonldDepartmentRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderAreaJsonldDepartmentRead object, {
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
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderAreaJsonldDepartmentRead object, {
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
    required BoulderAreaJsonldDepartmentReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'@context':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BoulderJsonldBoulderItemGetContext),
          ) as BoulderJsonldBoulderItemGetContext;
          result.atContext.replace(valueDes);
          break;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderAreaJsonldDepartmentRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderAreaJsonldDepartmentReadBuilder();
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
