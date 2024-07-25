import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWithMarker extends StatefulWidget {
  const GoogleMapWithMarker({super.key});

  @override
  State<GoogleMapWithMarker> createState() => _GoogleMapWithMarkerState();
}

class _GoogleMapWithMarkerState extends State<GoogleMapWithMarker> {

  late GoogleMapController mapController;
  Set<Marker> markers = {};

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }

  void _onAddMarker(LatLng location){
    setState(() {
      markers.add(
        Marker(
            markerId: MarkerId(location.toString()),
            position: location,
            infoWindow: const InfoWindow(
              title: 'New Marker'
            )
        )
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map With Marker'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GoogleMap(

        onMapCreated: _onMapCreated,
          markers: markers,
          onTap: _onAddMarker,
          initialCameraPosition: const CameraPosition(
              target:  LatLng(18.5204, 73.8567),zoom: 12)
      ),
    );
  }
}
