import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gpstracking/provider/stopwatch_provider.dart';
import 'package:provider/provider.dart';

class NewRunPage extends StatelessWidget {
  const NewRunPage({Key? key}) : super(key: key);


  format(Duration d) => d.toString().split('.').first.padLeft(2, "0");

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
              } else {
                provider.stop();
              }
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
