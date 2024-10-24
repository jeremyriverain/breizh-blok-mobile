import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageSwitcherTile extends StatelessWidget {
  LanguageSwitcherTile({
    required this.currentLocale,
    super.key,
  });

  final String currentLocale;

  final Map<String, Map<String, String>> languages = {
    'en': {
      'name': 'English',
      'flag': 'assets/gb_flag.svg',
    },
    'fr': {
      'name': 'Français',
      'flag': 'assets/fr_flag.svg',
    },
  };

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: const Text('Langage'),
      trailing: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: currentLocale,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (String? newValue) {},
          items: languages.entries.map((entry) {
            return DropdownMenuItem(
              value: entry.key,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    entry.value['flag']!,
                    width: 24,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(entry.value['name']!),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
