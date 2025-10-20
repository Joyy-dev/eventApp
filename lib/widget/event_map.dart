import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class EventMap extends StatelessWidget {
  const EventMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(37.4219983, -122.084),
          initialZoom: 14
        ),
        children: [
          
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(37.4219983, -122.084),
                width: 40,
                height: 40, 
                child: Icon(Icons.location_pin)
              )
            ]
          )
        ]
      ),
    );
  }
}