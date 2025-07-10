// ignore_for_file: avoid_print

import 'package:breizh_blok_mobile/ui/core/widgets/my_bar_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import '../../../widget_test_utils.dart';
@GenerateNiceMocks([MockSpec<TitleMeta>()])
import 'my_bar_chart_test.mocks.dart';

void main() {
  testWidgets('BoulderAreaBarChart', (tester) async {
    await tester.myPumpWidget(
      widget: const MyBarChart(
        title: 'foo',
        data: {'5a': 2, '6a': 3, '7b+': 1},
      ),
    );
    await tester.pump();

    expect(find.textContaining('foo'), findsOneWidget);

    final w = find.byType(BarChart).evaluate().first.widget as BarChart;
    expect(w.data.barGroups.length, 3);
    expect(w.data.barGroups[0].x, 0);
    expect(w.data.barGroups[0].barRods.length, 1);
    expect(w.data.barGroups[0].barRods[0].toY, 2);

    expect(w.data.barGroups[1].x, 1);
    expect(w.data.barGroups[1].barRods.length, 1);
    expect(w.data.barGroups[1].barRods[0].toY, 3);

    expect(w.data.barGroups[2].x, 2);
    expect(w.data.barGroups[2].barRods.length, 1);
    expect(w.data.barGroups[2].barRods[0].toY, 1);

    expect(w.data.maxY, 4);

    expect(_getTitleText(barChart: w, index: 0), '5a');
    expect(_getTitleText(barChart: w, index: 1), '6a');
    expect(_getTitleText(barChart: w, index: 2), '7b+');
  });
}

String? _getTitleText({required BarChart barChart, required double index}) {
  return ((barChart.data.titlesData.bottomTitles.sideTitles.getTitlesWidget(
                    index,
                    MockTitleMeta(),
                  )
                  as SideTitleWidget)
              .child
          as Text)
      .data;
}
