import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  /// < DEKLARASI VARIABLE>
  double lokasiLatitude;
  double lokasiLongitude;

  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};

  static LatLng _center = LatLng(-7.3146, 112.7571);
  LatLng _lastMapPosition = _center;

  /// <END DEKLARASI>

  ///   Deklarasi function
  Future _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lokasiLatitude = position.latitude;
      lokasiLongitude = position.longitude;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onAddMarkerButtonPressed(LatLng latlang) {
    _center = latlang;
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: latlang,
          infoWindow: InfoWindow(title: 'Lokasi Anda', snippet: ''),
          icon: BitmapDescriptor.defaultMarker));
    });
  }

  ///  End deklarasi fuction
  @override
  void initState() {
    _getCurrentLocation();
    (lokasiLatitude == null)
        ? {lokasiLatitude = -7.3146, lokasiLongitude = 112.7571}
        : _getCurrentLocation();
    super.initState();
  }

  ///  Build Function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Lokasi Anda'),
      ),
      body: GoogleMap(
        onTap: (latlang) {
          _onAddMarkerButtonPressed(latlang);
          print(latlang.latitude);
          print(latlang.longitude);
        },
        onMapCreated: _onMapCreated,
        onCameraMove: _onCameraMove,
        markers: _markers,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: _center,
            // LatLng(-7.9479768, 111.9641728),
            zoom: 12),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          EasyLoading.showSuccess('Berhasil Set Lokasi');
        },
        child: Text('Set Lokasi'),
        style: ElevatedButton.styleFrom(
            elevation: 8, primary: Colors.red, shadowColor: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
