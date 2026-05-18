import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_order_param.freezed.dart';

const kGradeOrderParam = 'order[grade.name]';
const kIdOrderParam = 'order[id]';

const kAscendantDirection = 'asc';
const kDescendantDirection = 'desc';

@freezed
abstract class ApiOrderParam with _$ApiOrderParam {
  const factory ApiOrderParam({
    required String name,
    required String direction,
  }) = _ApiOrderParam;
}
