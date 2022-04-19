import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gpstracking/domain/quote.dart';
import 'package:http/http.dart' as http;

class MotivationPage extends StatelessWidget {
  const MotivationPage({Key? key}) : super(key: key);

  Future<Quote> loadQuote() async {
    var response = await http
        .get(Uri.parse("https://api.quotable.io/random?tags=inspirational"));
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    return Quote.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Motivation"),
      ),
      body: Container(
        child: FutureBuilder(
          future: loadQuote(),
          builder: (BuildContext context, AsyncSnapshot<Quote> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(snapshot.data!.quote, style: Theme.of(context).textTheme.headline5,textAlign: TextAlign.center),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text("~ ${snapshot.data!.author}", style: Theme.of(context).textTheme.headline6,),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
