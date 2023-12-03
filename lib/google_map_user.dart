import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/home_screen_items_des/user_details_show.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';

class UserMap extends StatefulWidget {
  const UserMap({Key? key}) : super(key: key);

  @override
  State<UserMap> createState() => UserMapState();
}

Completer<GoogleMapController> _controller = Completer();
LocationData? currentLocation;
String address = 'Click here to set address';

class UserMapState extends State<UserMap> {
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
      );
      setState(() {
        currentLocation = LocationData.fromMap({
          "latitude": position.latitude,
          "longitude": position.longitude,
        });
      });
      getAddress(position.latitude, position.longitude);
    } catch (e) {
      print('Error getting location: $e');
      setState(() {
        address = 'Error getting location';
      });
    }
  }

  void getAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String newAddress = '${place.subLocality},${place.thoroughfare}'
            ',${place.subAdministrativeArea}, ${place.administrativeArea}';
        setState(() {
          address = newAddress;
        });
      } else {
        setState(() {
          address = 'Address not found';
        });
      }
    } catch (e) {
      print('Error getting address: $e');
      setState(() {
        address = 'Address not found';
      });
    }
  }

  @override
  void dispose() {
    _controller.future.then((controller) {
      controller.dispose(); // Dispose of the controller when the widget is disposed.
    });
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _animateToUserLocation() async {
    final controller = await _controller.future;
    if (currentLocation != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              currentLocation!.latitude!,
              currentLocation!.longitude!,
            ),
            zoom: 14,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null
          ? const Center(child: Text('Loading'))
          : Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                currentLocation!.latitude!,
                currentLocation!.longitude!,
              ),
              zoom: 14.6,
            ),
            markers:  {
              Marker (
                markerId: const MarkerId('User Location'),
                position: LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                ),
              ),
            },
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: FloatingActionButton(
              child: const Icon(Icons.location_searching_outlined),
              onPressed: () {
                _animateToUserLocation();
              },
            ),
          ),
          UserDetails(adrress: address,)
        ],
      ),
    );
  }
}
