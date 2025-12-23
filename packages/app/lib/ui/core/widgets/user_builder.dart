import 'package:breizh_blok_mobile/domain/entities/user/user.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/auth_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserBuilder extends StatelessWidget {
  const UserBuilder({
    required this.builder,
    this.loadingBuilder,
    this.errorBuilder,
    super.key,
  });

  final Widget Function(BuildContext context, User?) builder;

  final Widget Function()? loadingBuilder;
  final Widget Function(Object error, StackTrace stackTrace)? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      builder: (context, auth) {
        if (!auth.isAuthenticated) {
          return builder(context, null);
        }

        return Consumer(
          builder: (context, ref, _) {
            final asyncUser = ref.watch(userProvider);

            final errorFn = errorBuilder;
            final loadingFn = loadingBuilder;
            return asyncUser.when(
              data: (user) => builder(context, user),
              error: (e, s) =>
                  errorFn != null ? errorFn(e, s) : const SizedBox.shrink(),
              loading: () =>
                  loadingFn != null ? loadingFn() : const SizedBox.shrink(),
            );
          },
        );
      },
    );
  }
}
