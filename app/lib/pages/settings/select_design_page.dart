import 'package:flutter/material.dart';
import 'package:gpstracking/domain/theme.dart';
import 'package:gpstracking/extensions/string_extensions.dart';
import 'package:gpstracking/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SelectDesignPage extends StatefulWidget {
  const SelectDesignPage({Key? key}) : super(key: key);

  @override
  State<SelectDesignPage> createState() => _SelectDesignPageState();
}

class _SelectDesignPageState extends State<SelectDesignPage> {

  late ThemeType selectedTheme;

  @override
  void initState() {
    super.initState();
    selectedTheme = Provider
        .of<ThemeProvider>(context, listen: false)
        .currentTheme;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Design'),
      ),
      body: Column(
          children:
          [
            for(int i = 0; i < ThemeType.values.length; i++)
              RadioListTile(
                title: Text(ThemeType.values[i].name.capitalize()),
                value: ThemeType.values[i],
                groupValue: selectedTheme,
                onChanged: (ThemeType? value) {
                  if (value != null) {
                    setState(() {
                      selectedTheme = value;
                    });
                    Provider.of<ThemeProvider>(context, listen: false).setTheme(
                        value);
                  }
                },
              ),
          ]
      ),
    );
  }
}
