import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../components/maps/detail_point_bottomsheet.dart';
import '../../constants/app_style.dart';
import '../../controllers/location_controller.dart';
import '../../models/locations/location.dart';

class MapScreen extends StatefulWidget {
  final LatLng? choosePoint;

  const MapScreen({super.key, this.choosePoint});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LocationController locationController = Get.put(LocationController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _addMarker(Location location) {
    final point = LatLng(location.latitude, location.longitude);

    final marker = Marker(
      point: point,
      child: InkWell(
        onTap: () {
          _scaffoldKey.currentState!
              .showBottomSheet((_) => DetailPointBottomSheet(
                    location: location,
                  ));
        },
        child: Container(
          child: Image.asset('assets/images/marker.png'),
        ),
      ),
    );
    _markers.add(marker);
  }

  final List<Marker> _markers = [];

  Future<void> loadMap() async {
    if (locationController.locationList.value != null) {
      locationController.locationList.value!.forEach((element) {
        _addMarker(element);
      });
    }
  }

  Future<void> goPoint() async {
    mapController.moveAndRotate(widget.choosePoint!, 16.0, 10);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMap();

    if (widget.choosePoint != null) {
      goPoint();
    }
  }

  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Recyling point',
            style: kLableTextStyleTilte22Green,
          )),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: widget.choosePoint != null
              ? widget.choosePoint!
              : const LatLng(10.8791224, 106.7813119),
          initialZoom: 16.0,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/sang2202/clw9086qk000001pn9wf50n01/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2FuZzIyMDIiLCJhIjoiY2x3OHpwcTRvMmN4aDJqbnJoYXA3cXVxeiJ9.6iO3AueZyUYRfDcQHWUhmg',
            userAgentPackageName: 'com.example.app',
          ),
          const RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
              ),
            ],
          ),
          MarkerLayer(markers: _markers)
        ],
      ),
    );
  }
}
