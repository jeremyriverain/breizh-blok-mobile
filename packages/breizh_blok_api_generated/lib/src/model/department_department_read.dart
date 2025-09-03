//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/municipality_department_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'department_department_read.g.dart';

///
///
/// Properties:
/// * [name]
/// * [municipalities]
@BuiltValue()
abstract class DepartmentDepartmentRead
    implements
        Built<DepartmentDepartmentRead, DepartmentDepartmentReadBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'municipalities')
  BuiltList<MunicipalityDepartmentRead>? get municipalities;

  DepartmentDepartmentRead._();

  factory DepartmentDepartmentRead([
    void updates(DepartmentDepartmentReadBuilder b),
  ]) = _$DepartmentDepartmentRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DepartmentDepartmentReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DepartmentDepartmentRead> get serializer =>
      _$DepartmentDepartmentReadSerializer();
}

class _$DepartmentDepartmentReadSerializer
    implements PrimitiveSerializer<DepartmentDepartmentRead> {
  @override
  final Iterable<Type> types = const [
    DepartmentDepartmentRead,
    _$DepartmentDepartmentRead,
  ];

  @override
  final String wireName = r'DepartmentDepartmentRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DepartmentDepartmentRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.municipalities != null) {
      yield r'municipalities';
      yield serializers.serialize(
        object.municipalities,
        specifiedType: const FullType(BuiltList, [
          FullType(MunicipalityDepartmentRead),
        ]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DepartmentDepartmentRead object, {
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
    required DepartmentDepartmentReadBuilder result,
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
        case r'municipalities':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(MunicipalityDepartmentRead),
                    ]),
                  )
                  as BuiltList<MunicipalityDepartmentRead>;
          result.municipalities.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DepartmentDepartmentRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DepartmentDepartmentReadBuilder();
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
