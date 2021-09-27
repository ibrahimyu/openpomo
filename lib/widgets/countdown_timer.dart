import 'dart:async';

import 'package:flutter/material.dart';
import 'package:focusplus/utils/display_time.dart';
import 'package:get/get.dart';

class CountdownTimerCtrl extends GetxController
    with SingleGetTickerProviderMixin {
  Timer? timer;
  var timeLeft = 0.obs;
  var timerLength = 25 * 60;

  CountdownTimerCtrl() {
    timeLeft.value = timerLength;
  }

  bool get isActive {
    return timer?.isActive ?? false;
  }

  bool get isStopped => !isActive && !isPaused;

  bool _isPaused = false;
  bool get isPaused => _isPaused;

  void start() {
    // make sure it's not double
    timer?.cancel();
    _isPaused = false;
    // get a timer running
    timer = Timer.periodic(Duration(seconds: 1), tick);
    update();
  }

  void tick(Timer timer) {
    timeLeft.value--;
  }

  void pause() {
    timer?.cancel();
    _isPaused = true;
    update();
  }

  void stop() {
    _isPaused = false;
    timer?.cancel();
    timeLeft.value = timerLength;
    update();
  }
}

class CountdownTimer extends GetView<CountdownTimerCtrl> {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Text(
          displayTime(
            Duration(seconds: controller.timeLeft.value),
          ),
          style: TextStyle(fontSize: 64.0),
        ),
      ),
    );
  }
}

class CountdownTimerControl extends GetView<CountdownTimerCtrl> {
  const CountdownTimerControl({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GetBuilder<CountdownTimerCtrl>(
        builder: (ctrl) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ctrl.isActive
                  ? IconButton(
                      onPressed: () {
                        ctrl.pause();
                      },
                      icon: const Icon(Icons.pause),
                    )
                  : IconButton(
                      onPressed: () {
                        ctrl.start();
                      },
                      icon: const Icon(Icons.play_arrow),
                    ),
              if (!ctrl.isStopped)
                IconButton(
                  onPressed: () {
                    ctrl.stop();
                  },
                  icon: const Icon(Icons.stop),
                ),
            ],
          );
        },
      ),
    );
  }
}
