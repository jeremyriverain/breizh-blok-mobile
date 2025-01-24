import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';

class ApiOrderChoice {
  ApiOrderChoice({
    required this.label,
    required this.orderParam,
  });

  final String label;
  final ApiOrderParam orderParam;
}
