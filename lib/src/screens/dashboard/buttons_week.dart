import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:prueba_emqu/src/bloc/indicators/indicators_bloc.dart';

class ButtonsWeek extends StatefulWidget {
  const ButtonsWeek({super.key});

  @override
  State<ButtonsWeek> createState() => _ButtonsWeekState();
}

class _ButtonsWeekState extends State<ButtonsWeek> {
  _setDate(DateTime date) {
    final IndicatorsBloc indicatorsBloc = context.read<IndicatorsBloc>();
    indicatorsBloc.add(
        SetIndicatorsEvent(date: DateTime(date.year, date.month, date.day)));
  }

  @override
  void initState() {
    super.initState();

    _setDate(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final week = _listDateTimeOfWeek();
    return BlocBuilder<IndicatorsBloc, IndicatorsState>(
      builder: (context, state) {
        final IndicatorsBloc indicatorsBloc = context.read<IndicatorsBloc>();
        return SizedBox(
          width: size.width * 0.8,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: week
                .map((e) => _buttonDay(
                      context: context,
                      date: e,
                      indicatorsBloc: indicatorsBloc,
                      indicatorsBlocState: state,
                    ))
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buttonDay({
    required BuildContext context,
    required DateTime date,
    required IndicatorsBloc indicatorsBloc,
    required IndicatorsState indicatorsBlocState,
  }) {
    final dateFormated = DateFormat('EEEE', 'es').format(date);
    final isSelected = indicatorsBlocState.date != null &&
        indicatorsBlocState.date!.day == date.day;
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColorLight),
          // minimumSize: MaterialStateProperty.all(Size(50, 50)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: () {
          _setDate(date);
        },
        child: Text(dateFormated[0].toUpperCase() + dateFormated.substring(1)));
  }

  List<DateTime> _listDateTimeOfWeek() {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    final tuesday = monday.add(const Duration(days: 1));
    final wednesday = monday.add(const Duration(days: 2));
    final thursday = monday.add(const Duration(days: 3));
    final friday = monday.add(const Duration(days: 4));
    final saturday = monday.add(const Duration(days: 5));
    final sunday = monday.add(const Duration(days: 6));
    return [
      monday,
      tuesday,
      wednesday,
      thursday,
      friday,
      saturday,
      sunday,
    ];
  }
}
