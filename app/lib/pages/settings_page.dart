import 'package:flutter/material.dart';
import 'package:gpstracking/pages/settings/select_design_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Select Design'),
          onTap: () {
            // Provider.of<ThemeProvider>(context, listen: false).switchTheme();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SelectDesignPage(),
            ));
          },
        ),
        const ListTile(
          title: Text(
            'Item 2',
          ),
        ),
        const ListTile(
          title: Text('Item 3'),
        ),
      ],
    );
  }
}
