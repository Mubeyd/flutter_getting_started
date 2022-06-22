import 'package:flutter/material.dart';
import 'package:get_started/screens/productivity_timer/timer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scoped_model/scoped_model.dart';

import 'TomatoButton.dart';

class ProductivityTimerScreen extends StatelessWidget {
  const ProductivityTimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return ScopedModel(
      model: TimerModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Productivity Timer'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ScopedModelDescendant<TimerModel>(
                      builder: (context, _, model) => TomatoButton(Colors.red,
                          "Pomodoro", model.startPomodoro, size / 3.2)),
                  ScopedModelDescendant<TimerModel>(
                      builder: (context, _, model) => TomatoButton(
                          const Color(0xff8BC34A),
                          'Short Break',
                          model.startShort,
                          size / 3.2)),
                  ScopedModelDescendant<TimerModel>(
                      builder: (context, _, model) => TomatoButton(
                          const Color(0xff689F38),
                          'Long Break',
                          model.startLong,
                          size / 3.2)),
                ],
              ),
              Expanded(
                  child: ScopedModelDescendant<TimerModel>(
                builder: (context, _, model) => CircularPercentIndicator(
                  radius: 180.0,
                  lineWidth: 10.0,
                  percent: model.radius,
                  center: Text(model.time,
                      style: Theme.of(context).textTheme.headline4),
                  progressColor: Colors.green,
                ),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ScopedModelDescendant<TimerModel>(
                      builder: (context, _, model) => TomatoButton(
                          Colors.red, "Stop", model.stopTimer, size / 2.1)),
                  ScopedModelDescendant<TimerModel>(
                      builder: (context, _, model) => TomatoButton(
                          const Color(0xff689F38),
                          "Restart",
                          model.restart,
                          size / 2.1)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
