import 'package:breizh_blok_mobile/config/assets.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocaleSwitch extends StatelessWidget {
  LocaleSwitch({required this.currentLocale, super.key});

  final String currentLocale;

  final Map<String, ({String flag, String name})> languages = {
    'en': (name: 'English', flag: Assets.flagEnglish),
    'fr': (name: 'Français', flag: Assets.flagFrench),
  };

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Consumer(
        builder: (context, ref, _) {
          return DropdownMenu(
            width: 180,
            menuHeight: 120,
            inputDecorationTheme: const InputDecorationTheme(
              isDense: true,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            ),
            label: Text(AppLocalizations.of(context).language),
            initialSelection: currentLocale,
            onSelected: (String? newValue) {
              if (newValue == null) {
                return;
              }

              ref.read(myLocaleProvider.notifier).setLocale(Locale(newValue));
            },
            leadingIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 8),
                SvgPicture.asset(
                  languages[currentLocale]!.flag,
                  width: 27,
                  height: 18,
                ),
              ],
            ),
            dropdownMenuEntries: languages.entries
                .map<DropdownMenuEntry<String>>((
                  entry,
                ) {
                  return DropdownMenuEntry<String>(
                    value: entry.key,
                    label: entry.value.name,
                    leadingIcon: SvgPicture.asset(
                      entry.value.flag,
                      width: 24,
                      height: 16,
                    ),
                  );
                })
                .toList(),
          );
        },
      ),
    );
  }
}
