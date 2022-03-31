import 'package:flutter/material.dart';
import 'package:gpstracking/domain/run.dart';
import 'package:gpstracking/pages/run_page.dart';
import 'package:intl/intl.dart';

class RunListTile extends StatelessWidget {
  final Run run;

  const RunListTile({Key? key, required this.run}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var formatedTime = Duration(
            hours: run.duration ~/ 3600,
            minutes: run.duration % 3600 ~/ 60,
            seconds: run.duration % 3600 % 60)
        .toString();
    formatedTime = formatedTime.substring(0, formatedTime.indexOf("."));
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => RunPage())));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          color: theme.bottomAppBarColor,
          child: Container(
            color: theme.bottomAppBarColor,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text(
                  '${run.distance.toStringAsFixed(2)} km',
                  style: theme.textTheme.bodyText2,
                ),
                Text(formatedTime),
                Text(DateFormat("dd.MM.yyyy").format(run.start)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
