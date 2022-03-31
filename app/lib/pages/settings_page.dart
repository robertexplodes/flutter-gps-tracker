import 'package:flutter/material.dart';
import 'package:gpstracking/domain/setting.dart';
import 'package:gpstracking/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text('Item ${Setting.settings[index].name}'),
    //     );
    //   },
    //   itemCount: Setting.settings.length,
    // );
    return ListView(children: [
      ListTile(
        title: Text('Switch Theme', style: Theme.of(context).textTheme.bodyText2),
        onTap: () {
          Provider.of<ThemeProvider>(context,listen: false).switchTheme();
        },
      ),
      ListTile(
        title: Text('Item 2'),
      ),
      ListTile(
        title: Text('Item 3'),
      ),
    ]);
  }
}
