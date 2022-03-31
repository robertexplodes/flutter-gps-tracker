import 'package:flutter/material.dart';
import 'package:gpstracking/domain/weather_service.dart';
import 'package:gpstracking/provider/run_provider.dart';
import 'package:gpstracking/widgets/run_list_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherService weatherService = WeatherService();

  Map<String, dynamic> _currentWeather = {};

  @override
  void initState() {
    super.initState();
    weatherService.loadWeather().then((value) {
      setState(() {
        _currentWeather = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var runs = Provider.of<RunProvider>(context).runs;
    var weatherMain = _currentWeather["main"] == null
        ? ""
        : _currentWeather["main"] as String;
    var weatherIcon = _currentWeather["icon"] == null
        ? "50d"
        : _currentWeather["icon"] as String;
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            // title: Text('Test', textScaleFactor: 1,),
            background: Image.network(
                'http://openweathermap.org/img/wn/$weatherIcon@2x.png'),
          ),
          title: Text(
            weatherMain,
            style: Theme.of(context).textTheme.headline4,
          ),
          pinned: false,
          floating: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if(index >= runs.length) return SizedBox(height: 60);
              return RunListTile(run: runs[index]);
            },
            childCount: runs.length + 1,

          ),
        ),
      ],
    );
  }
}
