import 'package:flutter/material.dart';
import 'package:gpstracking/pages/settings/motivation_page.dart';
import 'package:gpstracking/pages/settings/select_design_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.color_lens_sharp),
          title: const Text('Select Design'),
          onTap: () {
            // Provider.of<ThemeProvider>(context, listen: false).switchTheme();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SelectDesignPage(),
            ));
          },
        ),
        const ListTile(
          leading: Icon(Icons.account_circle_sharp),
          title: Text(
            'Account',
          ),
        ),
        ListTile(
          leading: const Text("💪"),
          title: const Text('Motivation'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const MotivationPage(),
            ));
          },
        ),
      ],
    );
  }
}
