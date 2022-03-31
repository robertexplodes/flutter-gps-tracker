import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class NewRunPage extends StatefulWidget {
  NewRunPage({Key? key}) : super(key: key);

  @override
  State<NewRunPage> createState() => _NewRunPageState();
}

class _NewRunPageState extends State<NewRunPage> {
  Stopwatch stopwatch = Stopwatch();

  @override
  void initState() {
    super.initState();
  }

  format(Duration d) => d.toString().split('.').first.padLeft(2, "0");

  bool running = false;

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var time = stopwatch.elapsed;
    var formattedTime = format(time);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text(
              formattedTime,
              style: theme.textTheme.headline1,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (!running) {
                  stopwatch.start();
                  timer = Timer.periodic(Duration(seconds: 1), (timer) {
                    setState(() {

                    });
                  });
                } else {
                  stopwatch.stop();
                  timer!.cancel();
                }
                setState(() {
                  running = !running;
                });
              });
            },
            child: Container(
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.cardColor,
                  ),
                  color: theme.cardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Icon(running ? Icons.pause : Icons.play_arrow,
                  color: theme.textTheme.bodyText2?.color, size: 40),
            ),
          ),
        ],
      ),
    );
  }
}
