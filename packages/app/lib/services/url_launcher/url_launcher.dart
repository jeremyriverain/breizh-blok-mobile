import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UrlLauncher {
  TaskEither<DomainException, void> openUrl(Uri uri);
}
