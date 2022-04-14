import 'package:flutter/material.dart';
import 'package:gpstracking/domain/run.dart';
import 'package:gpstracking/pages/run_page.dart';
import 'package:gpstracking/provider/run_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RunListTile extends StatelessWidget {
  final Run run;

  const RunListTile({Key? key, required this.run}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var formattedTime = Duration(
            hours: run.duration ~/ 3600,
            minutes: run.duration % 3600 ~/ 60,
            seconds: run.duration % 3600 % 60)
        .toString();
    formattedTime = formattedTime.substring(0, formattedTime.indexOf("."));
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => RunPage(run: run))));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Dismissible(
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: theme.backgroundColor,
                title: Text(
                  "Delete run",
                  style: theme.textTheme.headline6,
                ),
                content: Text(
                  "Are you sure you want to delete this run?",
                  style: theme.textTheme.bodyText2,
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      "Cancel",
                      style: theme.textTheme.bodyText2,
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  TextButton(
                    child: Text(
                      "Delete",
                      style: theme.textTheme.bodyText2,
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ),
            );
          },
          onDismissed: (direction) {
            Provider.of<RunProvider>(context, listen: false).deleteRun(run.id);
          },
          direction: DismissDirection.startToEnd,
          background: Container(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          key: GlobalKey(),
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
                        formattedTime,
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
      ),
    );
  }
}
