import 'dart:async';

import 'package:flutter/material.dart';
import 'package:openpomo/utils/display_time.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? timer;
  double pomoDuration = 100;
  double timeLeft = 0;

  @override
  void initState() {
    super.initState();
    timeLeft = pomoDuration;
  }

  void start() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft--;
      });

      if (timeLeft <= 0) {
        stop();
      }
    });
  }

  void pause() {
    timer?.cancel();
    timer = null;
    setState(() {});
  }

  void stop() {
    timer?.cancel();
    timer = null;
    timeLeft = pomoDuration;
  }

  double get getSize {
    var size = MediaQuery.of(context).size;
    var height = size.width > size.height ? size.height : size.width;
    return height / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: getSize,
                  height: getSize,
                  child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 1000),
                      tween: Tween(begin: timeLeft, end: timeLeft - 1),
                      builder: (context, value, widget) =>
                          CircularProgressIndicator(
                            value: value / (pomoDuration - 1),
                          )),
                ),
              ),
              Center(
                  child: Text(
                displayTime(Duration(seconds: timeLeft.round())),
                style: const TextStyle(
                  fontSize: 64,
                ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              timer != null
                  ? IconButton(
                      onPressed: () {
                        pause();
                      },
                      icon: const Icon(Icons.pause),
                    )
                  : IconButton(
                      onPressed: () {
                        start();
                      },
                      icon: const Icon(Icons.play_arrow),
                    ),
              IconButton(
                onPressed: () {
                  stop();
                },
                icon: const Icon(Icons.stop),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: () {
                  //
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
