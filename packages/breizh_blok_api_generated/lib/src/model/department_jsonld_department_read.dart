//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema.dart';
import 'package:built_collection/built_collection.dart';
import 'package:breizh_blok_api_generated/src/model/hydra_item_base_schema_context.dart';
import 'package:breizh_blok_api_generated/src/model/municipality_jsonld_department_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'department_jsonld_department_read.g.dart';

/// DepartmentJsonldDepartmentRead
///
/// Properties:
/// * [atContext]
/// * [atId]
/// * [atType]
/// * [name]
/// * [municipalities]
@BuiltValue()
abstract class DepartmentJsonldDepartmentRead
    implements
        HydraItemBaseSchema,
        Built<
          DepartmentJsonldDepartmentRead,
          DepartmentJsonldDepartmentReadBuilder
        > {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'municipalities')
  BuiltList<MunicipalityJsonldDepartmentRead>? get municipalities;

  DepartmentJsonldDepartmentRead._();

  factory DepartmentJsonldDepartmentRead([
    void updates(DepartmentJsonldDepartmentReadBuilder b),
  ]) = _$DepartmentJsonldDepartmentRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DepartmentJsonldDepartmentReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DepartmentJsonldDepartmentRead> get serializer =>
      _$DepartmentJsonldDepartmentReadSerializer();
}

class _$DepartmentJsonldDepartmentReadSerializer
    implements PrimitiveSerializer<DepartmentJsonldDepartmentRead> {
  @override
  final Iterable<Type> types = const [
    DepartmentJsonldDepartmentRead,
    _$DepartmentJsonldDepartmentRead,
  ];

  @override
  final String wireName = r'DepartmentJsonldDepartmentRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DepartmentJsonldDepartmentRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.atContext != null) {
      yield r'@context';
      yield serializers.serialize(
        object.atContext,
        specifiedType: const FullType(HydraItemBaseSchemaContext),
      );
    }
    yield r'@id';
    yield serializers.serialize(
      object.atId,
      specifiedType: const FullType(String),
    );
    yield r'@type';
    yield serializers.serialize(
      object.atType,
      specifiedType: const FullType(String),
    );
    if (object.municipalities != null) {
      yield r'municipalities';
      yield serializers.serialize(
        object.municipalities,
        specifiedType: const FullType(BuiltList, [
          FullType(MunicipalityJsonldDepartmentRead),
        ]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DepartmentJsonldDepartmentRead object, {
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
    required DepartmentJsonldDepartmentReadBuilder result,
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
        case r'@context':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(HydraItemBaseSchemaContext),
                  )
                  as HydraItemBaseSchemaContext;
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
        case r'municipalities':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(MunicipalityJsonldDepartmentRead),
                    ]),
                  )
                  as BuiltList<MunicipalityJsonldDepartmentRead>;
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
  DepartmentJsonldDepartmentRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DepartmentJsonldDepartmentReadBuilder();
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
