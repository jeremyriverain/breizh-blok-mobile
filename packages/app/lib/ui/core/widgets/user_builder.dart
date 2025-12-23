import 'package:breizh_blok_mobile/domain/entities/user/user.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/auth_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserBuilder extends StatelessWidget {
  const UserBuilder({required this.builder, super.key});

  final Widget Function(BuildContext context, AsyncValue<User?>) builder;

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      builder: (context, auth) {
        if (!auth.isAuthenticated) {
          return builder(context, const AsyncValue.data(null));
        }

        return Consumer(
          builder: (context, ref, _) {
            final user = ref.watch(userProvider);

            return builder(context, user);
          },
        );
      },
    );
  }
}
