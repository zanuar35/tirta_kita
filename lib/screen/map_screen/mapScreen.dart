import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  /// < DEKLARASI VARIABLE>
  double lokasiLatitude;
  double lokasiLongitude;

  double lat;
  double long;

  List<double> lokasi;

  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};

  static LatLng _center = LatLng(-7.3146, 112.7571);
  LatLng _lastMapPosition = _center;
  var alamat;

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
      body: Container(
        child: Stack(
          children: [
            GoogleMap(
              onTap: (latlang) async {
                lat = latlang.latitude;
                long = latlang.longitude;
                _onAddMarkerButtonPressed(latlang);
                print(latlang.latitude);
                print(latlang.longitude);

                List<Placemark> placemarks =
                    await placemarkFromCoordinates(lat, long);
                print(placemarks);

                setState(() {
                  alamat = placemarks[0].street +
                      ", " +
                      placemarks[0].subLocality +
                      ", " +
                      placemarks[0].locality;
                });
              },
              onMapCreated: _onMapCreated,
              //onCameraMove: _onCameraMove,
              markers: _markers,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                  target: _center,
                  // LatLng(-7.9479768, 111.9641728),
                  zoom: 12),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 10, left: 10),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      mainAxisSize: MainAxisSize.min,

                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.local_shipping_outlined,
                          color: Colors.white,
                          size: 32,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Alamat Pengiriman :',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    Text(
                      (alamat == null) ? 'Cari alamat pada Map' : '$alamat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: (alamat == null) ? 22 : 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setDouble('Lat', lat);
          prefs.setDouble('Long', long);
          EasyLoading.showSuccess('Berhasil Set Lokasi');
          print('Latitude : ' + prefs.getDouble('Lat').toString());
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Future.delayed(Duration(seconds: 2), () {
              _sendDataBack(context);
            });
          });
        },
        child: Text('Set Lokasi'),
        style: ElevatedButton.styleFrom(
            elevation: 8, primary: Colors.red, shadowColor: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _sendDataBack(BuildContext context) {
    String textToSendBack = 'a';

    Navigator.pop(context, textToSendBack);
  }
}
