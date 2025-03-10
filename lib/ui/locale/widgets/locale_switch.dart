import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/locale/view_models/locale_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocaleSwitch extends StatelessWidget {
  LocaleSwitch({required this.currentLocale, super.key});

  final String currentLocale;

  final languages = {
    'en': (name: 'English', flag: 'assets/gb_flag.svg'),
    'fr': (name: 'Français', flag: 'assets/fr_flag.svg'),
  };

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: DropdownMenu(
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
          context.read<LocaleViewModel>().add(
            LocaleUpdated(locale: Locale(newValue)),
          );
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
        dropdownMenuEntries:
            languages.entries.map<DropdownMenuEntry<String>>((entry) {
              return DropdownMenuEntry<String>(
                value: entry.key,
                label: entry.value.name,
                leadingIcon: SvgPicture.asset(
                  entry.value.flag,
                  width: 24,
                  height: 16,
                ),
              );
            }).toList(),
      ),
    );
  }
}
