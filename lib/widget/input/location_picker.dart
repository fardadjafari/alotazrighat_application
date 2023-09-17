import 'dart:math';

import 'package:alotazrighat_application/widget/button/zoom_map_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationPicker extends StatefulWidget {
  static const String route = 'point_to_latlng';

  double? lang;
  double? laut;

  LocationPicker(this.lang, this.laut, {Key? key}) : super(key: key);

  @override
  PointToLatlngPage createState() {
    return PointToLatlngPage();
  }
}

class PointToLatlngPage extends State<LocationPicker> {
  late final MapController mapController = MapController();
  final pointSize = 40.0;
  final pointY = 200.0;

  LatLng? latLng;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      updatePoint(null, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            onMapEvent: (event) {
              updatePoint(null, context);
            },
            center: LatLng(widget.laut ?? 5, widget.lang ?? 5),
            zoom: 11,
            minZoom: 3,
          ),
          // nonRotatedChildren: [
          //   FlutterMapZoomButtons(
          //     minZoom: 4,
          //     maxZoom: 19,
          //     mini: true,
          //     padding: 10,
          //     alignment: Alignment.bottomRight,
          //   ),
          // ],
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            if (latLng != null)
              MarkerLayer(
                markers: [
                  Marker(
                    width: pointSize,
                    height: pointSize,
                    point: latLng!,
                    builder: (ctx) => const FlutterLogo(),
                  )
                ],
              ),
          ],
        ),
        Container(
            color: Colors.white,
            height: 0,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   'flutter logo (${latLng?.latitude.toStringAsPrecision(4)},${latLng?.longitude.toStringAsPrecision(4)})',
                //   textAlign: TextAlign.center,
                // ),
              ],
            ))),
        Positioned(
            top: pointY - pointSize / 2,
            left: _getPointX(context) - pointSize / 2,
            child: Icon(Icons.crop_free, size: pointSize))
      ],
    );
  }

  void updatePoint(MapEvent? event, BuildContext context) {
    final pointX = _getPointX(context);
    setState(() {
      latLng = mapController.pointToLatLng(CustomPoint(pointX, pointY));
    });
  }

  double _getPointX(BuildContext context) {
    return MediaQuery.of(context).size.width / 2;
  }
}
