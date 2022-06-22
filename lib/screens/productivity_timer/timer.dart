import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:screen/screen.dart';

class TimerModel extends Model {
  Duration _time = const Duration(minutes: 25, seconds: 0);
  late Duration _fullTime;
  double _radius = 1;

  late Timer timer;
  String get time => returnTime(_time);
  double get radius => returnRadius(_radius);

  double returnRadius(double _radius) {
    return _radius;
  }

  String returnTime(Duration t) {
    AssetsAudioPlayer player = AssetsAudioPlayer();
    if (t.inSeconds <= 0) {
      _time = const Duration(minutes: 0, seconds: 0);
      //play sound using assets_audio_player
      player.open(Audio(
        // asset: "dong.mp3",
        "assets/sounds/",
      ));
      player.play();
      stopTimer();
    }
    String ts = t.toString();
    String minutes = ts.substring(2, 4);
    String seconds = ts.substring(5, 7);
    String formattedTime = minutes + ":" + seconds;
    return formattedTime;
  }

  void decrementTime() {
    if (_time.inSeconds > 0) {
      _time = _time - const Duration(seconds: 1);
      _radius = _time.inSeconds / _fullTime.inSeconds;
    } else {
      _time = const Duration(seconds: 0);
      _radius = 0;
      stopTimer();
    }
    notifyListeners();
  }

  void startPomodoro() {
    // Prevent screen from going into sleep mode:
    Screen.keepOn(true);
    _radius = 1;
    _time = const Duration(minutes: 25, seconds: 0);
    notifyListeners();
    _fullTime = _time;
    startTimer(25);
  }

  void startShort() {
    Screen.keepOn(true);
    _radius = 1;
    _time = const Duration(minutes: 5, seconds: 0);
    notifyListeners();
    _fullTime = _time;
    startTimer(5);
  }

  void startLong() {
    Screen.keepOn(true);
    _radius = 1;
    _time = const Duration(minutes: 20, seconds: 0);
    notifyListeners();
    _fullTime = _time;
    startTimer(20);
  }

  void startTimer(int minutes) {
    stopTimer();
    timer =
        Timer.periodic(const Duration(seconds: 1), (timer) => decrementTime());
  }

  void stopTimer() {
    if (timer.isActive) {
      timer.cancel();
    }
    Screen.keepOn(false);
  }

  void restart() {
    if (_time.inSeconds > 0) {
      Screen.keepOn(true);
      timer = Timer.periodic(
          const Duration(seconds: 1), (timer) => decrementTime());
    }
  }
}
