import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthBuilder extends StatelessWidget {
  const AuthBuilder({required this.builder, super.key});

  final Widget Function(BuildContext context, Auth auth) builder;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final auth = ref.watch(authProvider);

        return ValueListenableBuilder(
          valueListenable: auth.credentials,
          builder: (context, credentials, _) {
            return builder(context, auth);
          },
        );
      },
    );
  }
}
