import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_range_slider.g.dart';

part 'my_range_slider.freezed.dart';

@freezed
abstract class RangeEntry<T> with _$RangeEntry<T> {
  const factory RangeEntry({required String name, required T value}) =
      _RangeEntry;
}

class MyRangeSlider<T> extends StatelessWidget {
  const MyRangeSlider({
    required this.allValues,
    required this.selectedValues,
    required this.onChangeEnd,
    super.key,
  });

  final List<RangeEntry<T>> allValues;
  final Set<RangeEntry<T>> selectedValues;
  final void Function(Set<RangeEntry<T>> selectedValues) onChangeEnd;

  @override
  Widget build(BuildContext context) {
    if (allValues.length < 2) {
      // defensive condition, if there is less than 2 possible values,
      // then RangeSlider widget won't work
      return const SizedBox.shrink();
    }

    return Consumer(
      builder: (context, ref, _) {
        final notifier = ref.watch(
          _viewModelProvider(
            allValues,
            selectedValues,
          ).notifier,
        );

        final rangeValues = ref.watch(
          _viewModelProvider(
            allValues,
            selectedValues,
          ),
        );
        return Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: '${AppLocalizations.of(context).min}: '),
                        TextSpan(
                          text: allValues[(rangeValues.start as num).toInt()]
                              .name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    key: const Key('my-range-slider-min'),
                  ),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: '${AppLocalizations.of(context).max}: '),
                        TextSpan(
                          text:
                              allValues[(rangeValues.end as num).toInt()].name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    key: const Key('my-range-slider-max'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
              child: RangeSlider(
                max: allValues.length - 1,
                divisions: allValues.length - 1,
                values: rangeValues,
                onChanged: notifier.onChanged,
                onChangeEnd: (values) {
                  onChangeEnd(notifier.fromRangeValuesToSet(values));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

@riverpod
class _ViewModel<T> extends _$ViewModel<T> {
  @override
  RangeValues build(
    List<RangeEntry<T>> allValues,
    Set<RangeEntry<T>> selectedValues,
  ) {
    final selectedGrades = selectedValues.toList()
      ..sort((a, b) => a.name.compareTo(b.name));

    if (selectedGrades.isEmpty) {
      return RangeValues(
        0,
        (allValues.length - 1).toDouble(),
      );
    } else {
      final startIndex = allValues.indexWhere(
        (element) => element == selectedValues.first,
      );
      final endIndex = allValues.indexWhere(
        (element) => element == selectedValues.last,
      );
      if (startIndex != -1 && endIndex != -1) {
        return RangeValues(
          startIndex.toDouble(),
          endIndex.toDouble(),
        );
      } else {
        return RangeValues(
          0,
          (allValues.length - 1).toDouble(),
        );
      }
    }
  }

  // ignore: use_setters_to_change_properties
  void onChanged(RangeValues values) {
    state = values;
  }

  Set<RangeEntry<T>> fromRangeValuesToSet(RangeValues values) {
    final startIndex = values.start.round();
    final endIndex = values.end.round();
    var newValues = <RangeEntry<T>>{};
    if (startIndex != 0 || endIndex != allValues.length - 1) {
      newValues = {
        ...allValues.getRange(
          startIndex,
          endIndex + 1,
        ),
      };
    }
    return newValues;
  }
}
