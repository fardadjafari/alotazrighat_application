import 'package:alotazrighat_application/pages/send_page/logic/bloc/send_bloc.dart';
import 'package:alotazrighat_application/widget/button/squre_button.dart';
import 'package:alotazrighat_application/widget/color_utility.dart';
import 'package:alotazrighat_application/widget/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

class LocationPicker extends StatefulWidget {
  static const String route = 'point_to_latlng';

  double? lang;
  double? laut;
  final String sex;

  final String? nurseSex;

  final String address;

  final String areaId;

  final String serviceTypeId;

  final int quantity;

  final String discountCode;

  LocationPicker(
    this.lang,
    this.laut, {
    Key? key,
    required this.sex,
    this.nurseSex,
    required this.address,
    required this.areaId,
    required this.serviceTypeId,
    required this.quantity,
    required this.discountCode,
  }) : super(key: key);

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
              zoom: 16,
              maxZoom: 16,
              minZoom: 16),
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
                    rotate: false,
                    point: latLng!,
                    builder: (ctx) => SvgPicture.asset(
                      "assets/icons/location.svg",
                      width: getWidth(context, 0.07),
                    ),
                  )
                ],
              ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: getHeight(context, 0.02),
                          right: getWidth(context, 0.03)),
                      child: FloatingActionButton(
                        onPressed: () {
                          latLng = LatLng(widget.laut ?? 5, widget.lang ?? 5);
                          mapController.move(
                              LatLng(widget.laut ?? 5, widget.lang ?? 5), 18);
                          mapController.rotate(0);
                          setState(() {});
                        },
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.location_on,
                          color: bgColor,
                        ),
                      ),
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquereButton(
                    text: "تایید مکان  ",
                    color: bgColor,
                    press: () {
                      context.read<SendBloc>().add(AddRequestEvent(
                          latLng!.longitude,
                          latLng!.latitude,
                          widget.discountCode,
                          address: widget.address,
                          areaId: widget.areaId,
                          nurseSex: widget.nurseSex,
                          quantity: widget.quantity,
                          serviceTypeId: widget.serviceTypeId,
                          sex: widget.sex));
                    },
                    textColor: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
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
