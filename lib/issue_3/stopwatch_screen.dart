import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class StopwatchApp extends StatefulWidget {
  const StopwatchApp({super.key, required this.title});

  final String title;

  @override
  StopwatchState createState() => StopwatchState();
}

class StopwatchState extends State<StopwatchApp> {
  final Stopwatch _stopwatch = Stopwatch();
  bool _isRunning = false;
  late Timer _stopwatchTimer;
  int _milliseconds = 0;

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _stopwatch.start();
    _stopwatchTimer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      setState(() {
        _milliseconds = _stopwatch.elapsedMilliseconds;
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
    });
    _stopwatch.stop();
    _stopwatchTimer.cancel();
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _milliseconds = 0;
    });
    _stopwatch
      ..stop()
      ..reset();
  }

  @override
  void dispose() {
    super.dispose();
    _stopwatch.stop();
    _stopwatchTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final displayMilliseconds =
        (_milliseconds % 1000).toString().padLeft(3, '0');
    final displaySeconds =
        ((_milliseconds / 1000) % 60).floor().toString().padLeft(2, '0');
    final displayMinutes =
        ((_milliseconds / (1000 * 60)) % 60).floor().toString().padLeft(2, '0');
    final displayHours =
        (_milliseconds / (1000 * 60 * 60)).floor().toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$displayHours'
              ':$displayMinutes'
              ':$displaySeconds'
              ':$displayMilliseconds',
              style: const TextStyle(
                fontSize: 48,
                fontFeatures: [
                  FontFeature.tabularFigures(),
                ],
              ),
              textScaleFactor: 1,
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _isRunning ? _stopTimer : _startTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  icon: Icon(
                    _isRunning ? Icons.stop : Icons.play_arrow,
                    color: _isRunning ? Colors.red : Colors.green,
                  ),
                  label: Text(_isRunning ? 'ストップ' : 'スタート'),
                ),
                const SizedBox(width: 28),
                ElevatedButton.icon(
                  onPressed: _resetTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  icon: const Icon(
                    Icons.restart_alt,
                    color: Colors.blue,
                  ),
                  label: const Text('リセット'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
