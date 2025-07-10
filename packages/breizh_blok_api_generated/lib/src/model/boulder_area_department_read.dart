//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'boulder_area_department_read.g.dart';

///
///
/// Properties:
/// * [name]
@BuiltValue()
abstract class BoulderAreaDepartmentRead
    implements
        Built<BoulderAreaDepartmentRead, BoulderAreaDepartmentReadBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  BoulderAreaDepartmentRead._();

  factory BoulderAreaDepartmentRead(
          [void updates(BoulderAreaDepartmentReadBuilder b)]) =
      _$BoulderAreaDepartmentRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BoulderAreaDepartmentReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BoulderAreaDepartmentRead> get serializer =>
      _$BoulderAreaDepartmentReadSerializer();
}

class _$BoulderAreaDepartmentReadSerializer
    implements PrimitiveSerializer<BoulderAreaDepartmentRead> {
  @override
  final Iterable<Type> types = const [
    BoulderAreaDepartmentRead,
    _$BoulderAreaDepartmentRead
  ];

  @override
  final String wireName = r'BoulderAreaDepartmentRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BoulderAreaDepartmentRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    BoulderAreaDepartmentRead object, {
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
    required BoulderAreaDepartmentReadBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BoulderAreaDepartmentRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BoulderAreaDepartmentReadBuilder();
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
