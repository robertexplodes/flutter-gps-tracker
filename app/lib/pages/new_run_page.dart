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
          Text(
            formattedTime,
            style: theme.textTheme.headline1,
          ),
          InkWell(
            onTap: () {
              if (!provider.isRunning) {
                provider.start();
              } else {
                provider.stop();
              }
            },
            onLongPress: () {
              if (!provider.isRunning) return;
              provider.stop();
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        backgroundColor: theme.primaryColor,
                        title: Text(
                          'Stop',
                          style: theme.textTheme.headline4,
                        ),
                        content: Text(
                          'Are you sure you want to end this run?',
                          style: theme.textTheme.bodyText2,
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              'Cancel',
                              style: theme.textTheme.bodyText2,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          TextButton(
                            child: Text(
                              'Stop run',
                              style: theme.textTheme.bodyText2,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ));
            },
            child: CircleAvatar(
              radius: 40,
              child: Icon(
                provider.isRunning ? Icons.stop : Icons.play_arrow,
                color: provider.isRunning
                    ? Colors.red
                    : theme.textTheme.bodyText2?.color,
                size: 30,
              ),
            ),
          ),
          // Container(
          //   child: provider.started
          //       ? CircleAvatar(
          //           child: const Icon(Icons.stop, color: Colors.red),
          //
          //         )
          //       : null,
          // ),
        ],
      ),
    );
  }
}
