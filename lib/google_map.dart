import 'dart:async';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  final String latitude;
  final String longitude;
  final String restName;
  final String restAddress;
  final String restImage;

  const MapSample(
      {Key? key,
      required this.latitude,
      required this.longitude,
      required this.restAddress,
      required this.restName,
      required this.restImage})
      : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

Completer<GoogleMapController> _controller = Completer();
CustomInfoWindowController _customInfoWindowController =
    CustomInfoWindowController();

class MapSampleState extends State<MapSample> {
  @override
  Widget build(BuildContext context) {
    final CameraPosition kGooglePlex = CameraPosition(
      target:
          LatLng(double.parse(widget.latitude), double.parse(widget.longitude)),
      zoom: 16.0, // Adjust the zoom level as needed
    );
    return Scaffold(
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _customInfoWindowController.googleMapController = controller;
              },
              markers: {
                Marker(
                  markerId: const MarkerId('Restaurant',),
                  position: LatLng(
                    double.parse(widget.latitude),
                    double.parse(widget.longitude),
                  ),
                  onTap: () {
                    _customInfoWindowController.addInfoWindow!(
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                      height: 70,
                                  width: 180,
                                  decoration: BoxDecoration(image: DecorationImage(image:
                                  NetworkImage('https://foodie.junaidali.tk/storage/app/public/restaurant/cover/${widget.restImage}'),
                                      fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high),
                                  )),
                                ),
                                Text(widget.restName,style: GoogleFonts.actor(fontSize: 16,color: Colors.black)),
                                Text(widget.restAddress,style: GoogleFonts.actor(fontSize: 12,),)
                              ],
                            ),
                          ),
                        ),
                        LatLng(double.parse(widget.latitude),
                            double.parse(widget.longitude)));
                  },
                ),
              },
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 140,
            width: 180,
            offset: 35,
          )
        ],
      ),
    );
  }
}
