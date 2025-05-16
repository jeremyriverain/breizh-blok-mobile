import 'package:breizh_blok_mobile/ui/core/widgets/bar_chart_title.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarChart extends StatelessWidget {
  const MyBarChart({
    required this.data,
    this.title,
    super.key,
  });

  final Map<String, int> data;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final values = data.values;
    final keys = data.keys;
    final max =
        values.reduce((value, element) => value > element ? value : element);

    final title_ = title;
    return Column(
      children: [
        if (title_ != null) BarChartTitle(title: title_),
        AspectRatio(
          aspectRatio: 1.6,
          child: BarChart(
            BarChartData(
              barTouchData: barTouchData,
              titlesData: titlesData(keys.toList()),
              borderData: borderData,
              barGroups: barGroups(values.toList()),
              gridData: const FlGridData(show: false),
              alignment: BarChartAlignment.spaceAround,
              maxY: max > 10 ? max.toDouble() + 2 : max.toDouble() + 1,
            ),
          ),
        ),
      ],
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (BarChartGroupData group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(),
            );
          },
        ),
      );

  FlTitlesData titlesData(List<String> titles) {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: (double value, TitleMeta meta) {
            const style = TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            );

            return SideTitleWidget(
              axisSide: meta.axisSide,
              space: 4,
              child: Text(titles[value.toInt()], style: style),
            );
          },
        ),
      ),
      leftTitles: const AxisTitles(),
      topTitles: const AxisTitles(),
      rightTitles: const AxisTitles(),
    );
  }

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          Colors.red,
          Colors.green,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> barGroups(List<int> values) {
    final barGroups = <BarChartGroupData>[];
    for (var i = 0; i < values.length; i++) {
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              width: 10,
              toY: values[i].toDouble(),
              gradient: _barsGradient,
            ),
          ],
          showingTooltipIndicators: [0],
        ),
      );
    }

    return barGroups;
  }
}
