import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:gpstracking/domain/run.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class RunPage extends StatefulWidget {
  final Run run;

  const RunPage({Key? key, required this.run}) : super(key: key);

  @override
  State<RunPage> createState() => _RunPageState();
}

class _RunPageState extends State<RunPage> {
  var center = LatLng(48.2053, 15.6369);

  var locations = [
    LatLng(48.2053, 15.6369),
    LatLng(48.2073, 15.6343),
    LatLng(48.2075, 15.6320)
  ];

  var mapController = MapController();

  @override
  Widget build(BuildContext context) {
    var formattedTime = Duration(
            hours: widget.run.duration ~/ 3600,
            minutes: widget.run.duration % 3600 ~/ 60,
            seconds: widget.run.duration % 3600 % 60)
        .toString();
    formattedTime = formattedTime.substring(0, formattedTime.indexOf("."));
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Run'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  FlutterMap(
                    options: MapOptions(
                      zoom: 14.0,
                      plugins: [
                        TappablePolylineMapPlugin(),
                      ],
                      center: center,
                    ),
                    mapController: mapController,
                    layers: [
                      TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                      ),
                      TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                      ),
                      MarkerLayerOptions(
                        markers: [
                          // Marker(
                          //   width: 50.0,
                          //   height: 50.0,
                          //   builder: (ctx) => Container(
                          //     child: Image.network("http://via.placeholder.com/350x150"),
                          //   ),
                          //   point: LatLng(48.207350, lonL[latL.indexOf(48.207350)]),
                          // ),
                        ],
                      ),
                      TappablePolylineLayerOptions(
                        // Will only render visible polylines, increasing performance
                        polylineCulling: true,
                        polylines: [
                          TaggedPolyline(
                            tag: "asd",
                            points: locations,
                            color: Colors.blueGrey,
                            strokeWidth: 5.0,
                            // plot size
                            isDotted: false, // if true id display dotted,
                          ),
                        ],
                        // onTap: (TaggedPolyline polyline) => print(polyline.tag),
                        // onMiss: () => print("No polyline tapped"),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: CircleAvatar(
                          child: IconButton(
                            alignment: Alignment.bottomRight,
                            onPressed: () {
                              setState(() {
                                mapController.move(center, 14.0);
                              });
                            },
                            icon: Icon(Icons.gps_fixed),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      DateFormat("dd.MM.yyyy HH:mm").format(widget.run.start),
                      style: theme.textTheme.headline6,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Duration: $formattedTime",
                      style: theme.textTheme.headline6,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Distance: ${widget.run.distance.toStringAsFixed(2)} km",
                      style: theme.textTheme.headline6,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
