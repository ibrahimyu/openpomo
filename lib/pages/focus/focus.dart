import 'package:flutter/material.dart';
import 'package:focusplus/widgets/countdown_timer.dart';

class FocusPage extends StatelessWidget {
  const FocusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/focusbg.jpg'), fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  'Task Mode',
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CountdownTimer(),
                      SizedBox(height: 16.0),
                      Text(
                        'Success is not an option.',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              CountdownTimerControl(),
            ],
          ),
        ),
      ],
    );
  }
}
