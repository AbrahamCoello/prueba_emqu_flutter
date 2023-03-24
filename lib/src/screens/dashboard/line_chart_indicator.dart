import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import 'package:prueba_emqu/src/bloc/indicators/indicators_bloc.dart';
import 'package:prueba_emqu/src/utils/constants.dart';

final Map<int, dynamic> hours = {
  0: '00',
  1: '01',
  2: '02',
  3: '03',
  4: '04',
  5: '05',
  6: '06',
  7: '07',
  8: '08',
  9: '09',
  10: '10',
  11: '11',
  12: '12',
  13: '13',
  14: '14',
  15: '15',
  16: '16',
  17: '17',
  18: '18',
  19: '19',
  20: '20',
  21: '21',
  22: '22',
  23: '23',
};

final List<Color> gradientColors = [
  Colors.purple,
  Colors.purpleAccent,
];

class LineChartIndicator extends StatefulWidget {
  const LineChartIndicator({super.key});

  @override
  State<LineChartIndicator> createState() => _LineChartIndicatorState();
}

class _LineChartIndicatorState extends State<LineChartIndicator> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndicatorsBloc, IndicatorsState>(
      builder: (context, state) {
        return AspectRatio(
          aspectRatio: 2,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
            child: LineChart(
              mainData(context, state),
              swapAnimationDuration:
                  const Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.linear, // Optional
            ),
          ),
        );
      },
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );

// mostraremos solo cuando la hora sea par
    final ishourOdd = value.toInt() % 2 == 0;
    final text = ishourOdd ? hours[value.toInt()] : '';
    return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(BuildContext context, IndicatorsState state) {
    final dateSelected = state.date ?? DateTime.now();
    final nameDay = DateFormat('EEEE').format(dateSelected).toLowerCase();
    final dataSpot = kDataChart[nameDay];
    final FlLine flLine = FlLine(
      color: Theme.of(context).primaryColorLight,
      strokeWidth: 1,
    );
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (_) => flLine,
        getDrawingVerticalLine: (_) => flLine,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 40,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Theme.of(context).primaryColorLight),
      ),
      minX: 0,
      maxX: 23,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: dataSpot,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
