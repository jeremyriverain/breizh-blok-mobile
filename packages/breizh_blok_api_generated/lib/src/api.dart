//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:breizh_blok_api_generated/src/serializers.dart';
import 'package:breizh_blok_api_generated/src/auth/api_key_auth.dart';
import 'package:breizh_blok_api_generated/src/auth/basic_auth.dart';
import 'package:breizh_blok_api_generated/src/auth/bearer_auth.dart';
import 'package:breizh_blok_api_generated/src/auth/oauth.dart';
import 'package:breizh_blok_api_generated/src/api/auth_zero_user_api.dart';
import 'package:breizh_blok_api_generated/src/api/boulder_api.dart';
import 'package:breizh_blok_api_generated/src/api/boulder_area_api.dart';
import 'package:breizh_blok_api_generated/src/api/boulder_feedback_api.dart';
import 'package:breizh_blok_api_generated/src/api/department_api.dart';
import 'package:breizh_blok_api_generated/src/api/grade_api.dart';
import 'package:breizh_blok_api_generated/src/api/height_boulder_api.dart';
import 'package:breizh_blok_api_generated/src/api/media_api.dart';
import 'package:breizh_blok_api_generated/src/api/municipality_api.dart';
import 'package:breizh_blok_api_generated/src/api/rock_api.dart';

class BreizhBlokApiGenerated {
  static const String basePath = r'http://localhost';

  final Dio dio;
  final Serializers serializers;

  BreizhBlokApiGenerated({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  }) : this.serializers = serializers ?? standardSerializers,
       this.dio =
           dio ??
           Dio(
             BaseOptions(
               baseUrl: basePathOverride ?? basePath,
               connectTimeout: const Duration(milliseconds: 5000),
               receiveTimeout: const Duration(milliseconds: 3000),
             ),
           ) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor)
                  as OAuthInterceptor)
              .tokens[name] =
          token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor)
                  as BearerAuthInterceptor)
              .tokens[name] =
          token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor)
              as BasicAuthInterceptor)
          .authInfo[name] = BasicAuthInfo(
        username,
        password,
      );
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere(
                    (element) => element is ApiKeyAuthInterceptor,
                  )
                  as ApiKeyAuthInterceptor)
              .apiKeys[name] =
          apiKey;
    }
  }

  /// Get AuthZeroUserApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthZeroUserApi getAuthZeroUserApi() {
    return AuthZeroUserApi(dio, serializers);
  }

  /// Get BoulderApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  BoulderApi getBoulderApi() {
    return BoulderApi(dio, serializers);
  }

  /// Get BoulderAreaApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  BoulderAreaApi getBoulderAreaApi() {
    return BoulderAreaApi(dio, serializers);
  }

  /// Get BoulderFeedbackApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  BoulderFeedbackApi getBoulderFeedbackApi() {
    return BoulderFeedbackApi(dio, serializers);
  }

  /// Get DepartmentApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DepartmentApi getDepartmentApi() {
    return DepartmentApi(dio, serializers);
  }

  /// Get GradeApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  GradeApi getGradeApi() {
    return GradeApi(dio, serializers);
  }

  /// Get HeightBoulderApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  HeightBoulderApi getHeightBoulderApi() {
    return HeightBoulderApi(dio, serializers);
  }

  /// Get MediaApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MediaApi getMediaApi() {
    return MediaApi(dio, serializers);
  }

  /// Get MunicipalityApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MunicipalityApi getMunicipalityApi() {
    return MunicipalityApi(dio, serializers);
  }

  /// Get RockApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  RockApi getRockApi() {
    return RockApi(dio, serializers);
  }
}
