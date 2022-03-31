import 'package:flutter/material.dart';

class NewRunPage extends StatelessWidget {
  const NewRunPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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