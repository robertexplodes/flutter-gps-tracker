import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gpstracking/provider/stopwatch_provider.dart';
import 'package:provider/provider.dart';
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

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<StopwatchProvider>(context);
    var formattedTime = format(provider.elapsedTime);
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
              if (!provider.isRunning) {
                provider.start();
                timer = Timer.periodic(Duration(seconds: 1), (timer) { setState(() {

                }); });
              } else {
                provider.stop();
                timer!.cancel();
              }
              provider.isRunning = !provider.isRunning;
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
              child: Icon(provider.isRunning ? Icons.pause : Icons.play_arrow,
                  color: theme.textTheme.bodyText2?.color, size: 40),
            ),
          ),
        ],
      ),
    );
  }
}
