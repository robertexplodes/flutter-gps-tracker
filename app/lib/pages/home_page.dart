import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gpstracking/domain/weather_service.dart';
import 'package:gpstracking/provider/run_provider.dart';
import 'package:gpstracking/provider/weather_provider.dart';
import 'package:gpstracking/widgets/run_list_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map<String, dynamic> _currentWeather = {};

  @override
  Widget build(BuildContext context) {
    var runs = Provider.of<RunProvider>(context).runs;
    var loadWeather = Provider.of<WeatherProvider>(context).loadWeatherData();
    return RefreshIndicator(
      displacement: 5,
      onRefresh: () => Provider.of<WeatherProvider>(context,listen: false).loadWeatherData(refresh: true),
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            flexibleSpace: FutureBuilder(
              future: loadWeather,
              builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox();
                }
                return FlexibleSpaceBar(
                  // title: Text('Test', textScaleFactor: 1,),
                  background: CachedNetworkImage(
                      imageUrl: 'http://openweathermap.org/img/wn/${snapshot.data!["icon"]}@2x.png'),
                );
              },
            ),
            title: FutureBuilder(
              future: loadWeather,
              builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white,),
                  );
                }
                if(snapshot.hasError) {
                  return const Center(
                    child: Text('Could not load weather!')
                  );
                }
                return Text(snapshot.data!["main"] as String);
              },
            ),
            pinned: false,
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index >= runs.length) return const SizedBox(height: 60);
                return RunListTile(run: runs[index]);
              },
              childCount: runs.length + 1,
            ),
          ),
        ],
      ),
    );
  }
}
