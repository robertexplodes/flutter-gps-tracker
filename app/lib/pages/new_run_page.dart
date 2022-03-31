import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class NewRunPage extends StatelessWidget {
  NewRunPage({Key? key}) : super(key: key);

  var stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  @override
  Widget build(BuildContext context) {
    stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));

    var theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Text('00:00', style: theme.textTheme.headline1,),
          ),
          GestureDetector(
            child: Container(
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.cardColor,
                  ),
                  color:  theme.cardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              child: Icon(Icons.play_arrow, color: theme.textTheme.bodyText2?.color,size: 40),
            ),
          ),
        ],
      ),
    );
  }
}
