import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/app_colors.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';

class CountdownTimer extends StatefulWidget {
  final int initialSeconds;
  final VoidCallback? onFinished;

  const CountdownTimer({super.key, this.initialSeconds = 300, this.onFinished});

  @override
  State<CountdownTimer> createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  late int _secondsRemaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.initialSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
        widget.onFinished?.call();
      }
    });
  }

  void restart() {
    _timer?.cancel();

    setState(() {
      _secondsRemaining = widget.initialSeconds;
    });

    _startTimer();
  }

  String get _formattedTime {
    final minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return '($minutes:$seconds)';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formattedTime,
      style: TextStyles.button1Medium.copyWith(color: AppColors.secondary),
    );
  }
}
