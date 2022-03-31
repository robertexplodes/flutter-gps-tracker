import 'package:flutter/material.dart';
import 'package:gpstracking/provider/run_provider.dart';
import 'package:gpstracking/widgets/run_list_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var runs = Provider.of<RunProvider>(context).runs;
    return ListView.builder(
      itemBuilder: (context, index) => RunListTile(run: runs[index]),
      itemCount: runs.length,
    );
  }
}
