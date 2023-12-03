import 'dart:async';
import 'dart:typed_data';
import 'dart:ui'as ui;
import 'dart:ui';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/models/restaurants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AllRestaurantLocation extends StatefulWidget {
  final List<Restaurants> restList;

  const AllRestaurantLocation({Key? key, required this.restList}) : super(key: key);

  @override
  State<AllRestaurantLocation> createState() => _AllRestaurantLocationState();
}

class _AllRestaurantLocationState extends State<AllRestaurantLocation> {
  final CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();

  final List<Marker> _marker = <Marker>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadData();
    });
  }

  Future<BitmapDescriptor> createMarkerIcon(String iconPath, double width, double height) async {
    final byteData = await rootBundle.load(iconPath);
    final buffer = byteData.buffer.asUint8List();
    final codec = await ui.instantiateImageCodec(buffer, targetHeight: height.toInt(), targetWidth: width.toInt());
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ByteData? byteDataResized = await  frameInfo.image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(byteDataResized!.buffer.asUint8List());
  }

  void loadData() async {
    for (int i = 0; i < widget.restList.length; i++){
      // Uint8List? image = await loadImageFromNetwork('assets/app_logo.png');
      var restaurantData = widget.restList[i];
      var latitude = double.parse(restaurantData.latitude.toString());
      var longitude = double.parse(restaurantData.longitude.toString());

      _marker.add(
        Marker(
          markerId: MarkerId(i.toString()),
          icon: await createMarkerIcon('assets/app_logo.png', 100,100),
          position: LatLng(latitude, longitude),
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
                              NetworkImage('https://foodie.junaidali.tk/storage/app/public/restaurant/cover/${restaurantData.coverPhoto}'),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high),
                              )),
                        ),
                        Text(restaurantData.name.toString(),style: GoogleFonts.actor(fontSize: 16,color: Colors.black)),
                        Text(restaurantData.address.toString(),style: GoogleFonts.actor(fontSize: 12,),)
                      ],
                    ),
                  ),
                ),
                LatLng(double.parse(restaurantData.latitude.toString()),
                    double.parse(restaurantData.longitude.toString())));
          },
        ),
      );
    }
    setState(() {}); // Trigger a rebuild to update the map with new markers
  }
 // Future<Uint8List?> loadImageFromNetwork (String path) async {
 //    final completed = Completer<ImageInfo>();
 //    var image = AssetImage(path);
 //
 //    image.resolve(ImageConfiguration()).addListener(
 //      ImageStreamListener((info,_) => completed.complete(info))
 //   );
 //    final imageInfo = await completed.future;
 //    final byteData = await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
 //
 //    return byteData!.buffer.asUint8List();
 //  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Restaurants Locations')),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(double.parse(widget.restList[0].latitude.toString()),
                  double.parse(widget.restList[0].longitude.toString())),
              zoom: 14,
            ),
            markers: Set.of(_marker),
            onTap: (position) {

            },
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 140,
            width: 180,
            offset: 35,
          ),
        ],
      ),
    );
  }
}
