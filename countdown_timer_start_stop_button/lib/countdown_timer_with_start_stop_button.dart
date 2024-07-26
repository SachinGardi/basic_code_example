import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimerWithStartStopButton extends StatefulWidget {
  final int duration;
  const CountDownTimerWithStartStopButton({super.key,required this.duration});

  @override
  State<CountDownTimerWithStartStopButton> createState() => _CountDownTimerWithStartStopButtonState();
}

class _CountDownTimerWithStartStopButtonState extends State<CountDownTimerWithStartStopButton> {

  late Timer _timer;
  int _remainingSeconds = 0;
  bool _isRunning = false;


  @override
  void initState() {
    _remainingSeconds = widget.duration;
    super.initState();
  }

  void _startTimer(){
    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_remainingSeconds > 0){
          _remainingSeconds--;
        }
        else{
          _isRunning = false;
          _timer.cancel();
        }
      });
    });
  }

  void _stopTimer(){
    setState(() {
      _isRunning = false;
      _timer.cancel();
    });
  }

  String get _timerText{
    final minutes = (_remainingSeconds ~/60).toString().padLeft(2,'0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2,'0');
    return '$minutes:$seconds';
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer with start stop button'),
        centerTitle:true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_timerText,style: TextStyle(
              fontSize:  72
            ),),
            SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed:_isRunning?null:_startTimer , child: const Text('Start')),
                const SizedBox(width: 16,),
                ElevatedButton(onPressed:_isRunning?_stopTimer:null , child: const Text('Stop')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
