import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  final int initialSecond;
  const CountDownTimer({super.key,required this.initialSecond});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {


  late int _secondLeft;
  late Timer _timer;


  @override
  void initState() {
    _secondLeft = widget.initialSecond;
    _timer = Timer.periodic(const Duration(seconds: 1), (_)=> _updateTimer());
    super.initState();
  }

  _updateTimer(){
    if(_secondLeft > 0){
      setState(() {
        _secondLeft --;
      });
    }
    else{
      _timer.cancel();
    }
  }

  @override
  void dispose() {
   _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    int minutes = _secondLeft ~/ 60;
    int seconds = _secondLeft % 60;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Countdown Timer'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height/8,
          width: MediaQuery.of(context).size.width/2,
          decoration: BoxDecoration(
            color: Colors.teal.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Center(child: Text('${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}')),
        ),
      ),
    );
  }
}
