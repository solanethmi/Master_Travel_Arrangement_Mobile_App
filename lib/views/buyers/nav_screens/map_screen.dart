import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.0660005);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  void getCurrentLocation() async {
    Location location = Location();

    LocationData? locationData;
    try {
      locationData = await location.getLocation();
    } catch (e) {
      print("Error getting location: $e");
    }

    if (locationData != null) {
      setState(() {
        currentLocation = locationData;
      });
    }
  }

  void getPolylinePoints() async {
    if (currentLocation != null && currentLocation!.latitude != null) {
      PolylinePoints polylinePoints = PolylinePoints();

      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'YOUR_GOOGLE_MAPS_API_KEY',
        PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!),
        PointLatLng(destination.latitude, destination.longitude),
      );

      if (result.points.isNotEmpty) {
        setState(() {
          result.points.forEach((PointLatLng point) {
            polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          });
        });
      }
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    getPolylinePoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Live Location",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: currentLocation == null
          ? const Center(child: Text("Loading"))
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentLocation!.latitude ?? 0.0,
                  currentLocation!.longitude ?? 0.0,
                ),
                zoom: 13.5,
              ),
              polylines: {
                Polyline(
                  polylineId: PolylineId("route"),
                  points: polylineCoordinates,
                  color: Colors.pink,
                  width: 6,
                ),
              },
              markers: {
                Marker(
                  markerId: MarkerId("currentLocation"),
                  position: LatLng(
                    currentLocation!.latitude ?? 0.0,
                    currentLocation!.longitude ?? 0.0,
                  ),
                ),
                Marker(
                  markerId: MarkerId("source"),
                  position: LatLng(
                    currentLocation!.latitude ?? 0.0,
                    currentLocation!.longitude ?? 0.0,
                  ),
                ),
                Marker(
                  markerId: MarkerId("destination"),
                  position: LatLng(destination.latitude, destination.longitude),
                ),
              },
            ),
    );
  }
}
