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
          color: theme.cardColor,
          child: Container(
            color: theme.cardColor,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      '${run.distance.toStringAsFixed(2)} km',
                      style: theme.textTheme.headline6,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      formatedTime,
                      textAlign: TextAlign.start,
                      style: theme.textTheme.bodyText2,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      DateFormat("dd.MM.yyyy").format(run.start),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
