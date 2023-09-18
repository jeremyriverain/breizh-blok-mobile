import 'package:breizh_blok_mobile/blocs/terms_of_use_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsOfUsePrompt {
  static Future<void> showTermsOfUse(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog.adaptive(
        key: const Key('terms-of-use'),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              Icon(
                Icons.warning,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "Conditions d'utilisation",
              ),
            ],
          ),
        ),
        content: const Text(
            // ignore: lines_longer_than_80_chars
            "L'escalade est un sport à risque. Sa pratique est sous l'entière responsabilité des pratiquants. Breizh Blok décline toute responsabilité en cas d'accident."),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.read<TermsOfUseBloc>().add(TermsOfUseAccepted());
              Navigator.pop(context);
            },
            child: const Text("J'accepte"),
          ),
        ],
      ),
    );
  }
}
