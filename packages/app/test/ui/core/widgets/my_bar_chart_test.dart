import 'package:breizh_blok_mobile/ui/core/widgets/my_bar_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  late TitleMeta titleMeta;

  setUp(() {
    titleMeta = MockTitleMeta();
    when(() => titleMeta.axisSide).thenReturn(AxisSide.bottom);
  });

  String? getTitleText({required BarChart barChart, required double index}) {
    return ((barChart.data.titlesData.bottomTitles.sideTitles.getTitlesWidget(
                      index,
                      titleMeta,
                    )
                    as SideTitleWidget)
                .child
            as Text)
        .data;
  }

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

    expect(getTitleText(barChart: w, index: 0), '5a');
    expect(getTitleText(barChart: w, index: 1), '6a');
    expect(getTitleText(barChart: w, index: 2), '7b+');
  });
}
