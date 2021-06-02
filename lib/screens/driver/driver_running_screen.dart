import 'dart:async';

import 'package:ambulance_flutter/api/place_services.dart';
import 'package:ambulance_flutter/components/btn.dart';
import 'package:ambulance_flutter/models/models.dart';
import 'package:ambulance_flutter/models/place.dart';
import 'package:ambulance_flutter/models/place_search.dart';
import 'package:flutter/material.dart';
import 'package:ambulance_flutter/key/secrets.dart'; // Stores the Google Maps API Key
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:math' show cos, sqrt, asin;

class DriverRunningScreen extends StatefulWidget {
  DriverRunningScreen({Key key, this.dispatch}) : super(key: key);

  Dispatch dispatch;

  @override
  _DriverRunningScreenState createState() => _DriverRunningScreenState();
}

class _DriverRunningScreenState extends State<DriverRunningScreen> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _initialLocation =
      CameraPosition(target: LatLng(25.0711824, 121.4810216), zoom: 18.0);

  Position _currentPosition;

  String _currentAddress;

  Position _startPosition;
  Position _destinationPosition;

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  String _startAddress = '';
  String _destinationAddress = '';
  String _placeDistance;
  String _distance;
  String _duration;
  int _totalPay;

  String textLabel = "Start";
  List<PlaceSearch> searchResults = [];
  PlaceServices placeServices;
  List<Marker> marker = List<Marker>();
  StreamController<Place> selectedLocation = StreamController<Place>();
  StreamController<LatLngBounds> bounds = StreamController<LatLngBounds>();

  Set<Marker> markers = {};

  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // Method for retrieving the current location
  _getCurrentLocation() async {
    final GoogleMapController mapController = await _controller.future;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        //_currentAddress = "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        _currentAddress = place.name;
        startAddressController.text = _currentAddress;
        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  // Method for calculating the distance between two places
  _calculateDistance() async {
    try {
      final GoogleMapController mapController = await _controller.future;

      Position _startPosition = Position(
          longitude: widget.dispatch.startLat,
          latitude: widget.dispatch.startLng);

      Position _destinationPosition = Position(
          longitude: widget.dispatch.endLat, latitude: widget.dispatch.endLng);

      if (_startPosition != null && _destinationPosition != null) {
        Position startCoordinates = _startPosition;
        Position destinationCoordinates = _destinationPosition;

        // Start Location Marker
        Marker startMarker = Marker(
          markerId: MarkerId('$startCoordinates'),
          position: LatLng(
            startCoordinates.latitude,
            startCoordinates.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Start',
            snippet: _startAddress,
          ),
          icon: BitmapDescriptor.defaultMarker,
        );

        // Destination Location Marker

        Marker destinationMarker = Marker(
          markerId: MarkerId('$destinationCoordinates'),
          position: LatLng(
            destinationCoordinates.latitude,
            destinationCoordinates.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Destination',
            snippet: _destinationAddress,
          ),
          icon: BitmapDescriptor.defaultMarker,
        );

        // Adding the markers to the list
        markers.add(startMarker);
        markers.add(destinationMarker);

        print('START COORDINATES: $startCoordinates');
        print('DESTINATION COORDINATES: $destinationCoordinates');

        Position _northeastCoordinates;
        Position _southwestCoordinates;

        // Calculating to check that the position relative
        // to the frame, and pan & zoom the camera accordingly.
        double miny =
            (startCoordinates.latitude <= destinationCoordinates.latitude)
                ? startCoordinates.latitude
                : destinationCoordinates.latitude;
        double minx =
            (startCoordinates.longitude <= destinationCoordinates.longitude)
                ? startCoordinates.longitude
                : destinationCoordinates.longitude;
        double maxy =
            (startCoordinates.latitude <= destinationCoordinates.latitude)
                ? destinationCoordinates.latitude
                : startCoordinates.latitude;
        double maxx =
            (startCoordinates.longitude <= destinationCoordinates.longitude)
                ? destinationCoordinates.longitude
                : startCoordinates.longitude;

        _southwestCoordinates = Position(latitude: miny, longitude: minx);
        _northeastCoordinates = Position(latitude: maxy, longitude: maxx);

        // Accommodate the two locations within the
        // camera view of the map
        mapController.animateCamera(
          CameraUpdate.newLatLngBounds(
            LatLngBounds(
              northeast: LatLng(
                _northeastCoordinates.latitude,
                _northeastCoordinates.longitude,
              ),
              southwest: LatLng(
                _southwestCoordinates.latitude,
                _southwestCoordinates.longitude,
              ),
            ),
            100.0,
          ),
        );

        await _createPolylines(startCoordinates, destinationCoordinates);

        double totalDistance = 0.0;

        // Calculating the total distance by adding the distance
        // between small segments
        for (int i = 0; i < polylineCoordinates.length - 1; i++) {
          totalDistance += _coordinateDistance(
            polylineCoordinates[i].latitude,
            polylineCoordinates[i].longitude,
            polylineCoordinates[i + 1].latitude,
            polylineCoordinates[i + 1].longitude,
          );
        }

        setState(() {
          _totalPay = totalDistance.toInt() * 50;
          _placeDistance = totalDistance.toStringAsFixed(2);
          print('DISTANCE: $_placeDistance km');
        });

        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  // Formula for calculating distance between two coordinates
  // https://stackoverflow.com/a/54138876/11910277
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places
  _createPolylines(Position start, Position destination) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Secrets.API_KEY, // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    _distance = result.distance;
    _duration = result.duration;

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    setState(() {
      polylines[id] = polyline;
    });
  }

  @override
  void initState() {
    placeServices = PlaceServices.init();
    _getCurrentLocation();
    _calculateDistance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            // Map View
            GoogleMap(
              markers: markers != null ? Set<Marker>.from(markers) : null,
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: (GoogleMapController controller) async {
                _controller.complete(controller);
              },
            ),
            // Show zoom buttons
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.blue[100], // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.add),
                          ),
                          onTap: () async {
                            final GoogleMapController mapController =
                                await _controller.future;
                            mapController.animateCamera(
                              CameraUpdate.zoomIn(),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipOval(
                      child: Material(
                        color: Colors.blue[100], // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.remove),
                          ),
                          onTap: () async {
                            final GoogleMapController mapController =
                                await _controller.future;
                            mapController.animateCamera(
                              CameraUpdate.zoomOut(),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Show current location button
            SafeArea(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.orange[100], // button color
                          child: InkWell(
                            splashColor: Colors.orange, // inkwell color
                            child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(Icons.my_location),
                            ),
                            onTap: () async {
                              final GoogleMapController mapController =
                                  await _controller.future;
                              mapController.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: LatLng(
                                      _currentPosition.latitude,
                                      _currentPosition.longitude,
                                    ),
                                    zoom: 18.0,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ClipOval(
                        child: Material(
                          color: Colors.orange[100], // button color
                          child: InkWell(
                            splashColor: Colors.orange, // inkwell color
                            child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(Icons.ac_unit),
                            ),
                            onTap: () async {
                              await _calculateDistance();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: DraggableScrollableSheet(
                initialChildSize: 0.1,
                minChildSize: 0.1,
                builder: (BuildContext context, myscrollController) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(.8),
                              offset: Offset(3, 2),
                              blurRadius: 7)
                        ]),
                    child: ListView(
                      controller: myscrollController,
                      children: [
                        Icon(
                          Icons.remove,
                          size: 50,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16),
                          child: Container(
                            color: Colors.grey.withOpacity(.3),
                            child: TextField(
                              textInputAction: TextInputAction.go,
                              cursorColor: Colors.blue.shade900,
                              decoration: InputDecoration(
                                enabled: false,
                                icon: Container(
                                  margin: EdgeInsets.only(left: 20, bottom: 15),
                                  width: 10,
                                  height: 10,
                                  child: Icon(
                                    Icons.info,
                                    color: Colors.blue,
                                  ),
                                ),
                                hintText: "派車資訊",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(15),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepOrange[300],
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(widget.dispatch.start),
                          subtitle: Text("起點"),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepOrange[300],
                            child: Icon(
                              Icons.where_to_vote,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(widget.dispatch.end),
                          subtitle: Text("終點"),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.18),
                            child: Icon(
                              FontAwesomeIcons.weight,
                              color: Colors.blue,
                            ),
                          ),
                          title: Text(widget.dispatch.weight + " kg"),
                          subtitle: Text("患者體重"),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(.18),
                            child: Icon(
                              Icons.local_phone,
                              color: Colors.blue,
                            ),
                          ),
                          title: Text(widget.dispatch.phone),
                          subtitle: Text("聯絡方式"),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(.18),
                            child: Icon(
                              Icons.fire_extinguisher,
                              color: Colors.blue,
                            ),
                          ),
                          title: Text(widget.dispatch.o2 == 1 ? "是" : "否"),
                          subtitle: Text("氧氣"),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(.18),
                            child: Icon(
                              Icons.elevator,
                              color: Colors.blue,
                            ),
                          ),
                          title:
                              Text(widget.dispatch.elevator == 1 ? "是" : "否"),
                          subtitle: Text("電梯"),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(.18),
                            child: Icon(
                              //Icons.healing,
                              FontAwesomeIcons.userNurse,
                              color: Colors.blue,
                            ),
                          ),
                          title: Text(widget.dispatch.special == 1 ? "是" : "否"),
                          subtitle: Text("特別護理師"),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(.18),
                            child: Icon(
                              Icons.sticky_note_2,
                              color: Colors.blue,
                            ),
                          ),
                          title: Text(widget.dispatch.remark),
                          subtitle: Text("備註"),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Btn(
                          text: '完成',
                          color: Colors.blue[500],
                          onPress: () {
                            //todo
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
