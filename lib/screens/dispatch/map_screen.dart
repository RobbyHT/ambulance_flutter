import 'dart:async';

import 'package:ambulance_flutter/api/place_services.dart';
import 'package:ambulance_flutter/components/btn.dart';
import 'package:ambulance_flutter/models/models.dart';
import 'package:ambulance_flutter/models/place.dart';
import 'package:ambulance_flutter/models/place_search.dart';
import 'package:flutter/material.dart';
import 'package:ambulance_flutter/key/secrets.dart'; // Stores the Google Maps API Key
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:math' show cos, sqrt, asin;

import 'form_screen.dart';

class MapView extends StatefulWidget {
  MapView({
    Key key,
    this.dispatch,
  }) : super(key: key);

  Dispatch dispatch;

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
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

  String textLabel = "";
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

  Widget _textField({
    TextEditingController controller,
    FocusNode focusNode,
    String label,
    String hint,
    double width,
    Icon prefixIcon,
    Widget suffixIcon,
    Function(String) locationCallback,
  }) {
    return Container(
      width: width * 0.8,
      child: TextField(
        onChanged: (value) {
          //locationCallback(value);
          searchPlace(value, label);
        },
        controller: controller,
        focusNode: focusNode,
        decoration: new InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey[400],
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.blue[300],
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          hintText: hint,
        ),
      ),
    );
  }

  // Method for retrieving the current location
  _getCurrentLocation() async {
    final GoogleMapController mapController = await _controller.future;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        _startPosition = position;
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
    // await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
    //     .then((Position position) async {
    //   setState(() {
    //     _currentPosition = position;
    //     print('CURRENT POS: $_currentPosition');
    //     // mapController.animateCamera(
    //     //   CameraUpdate.newCameraPosition(
    //     //     CameraPosition(
    //     //       target: LatLng(position.latitude, position.longitude),
    //     //       zoom: 18.0,
    //     //     ),
    //     //   ),
    //     // );
    //   });
    //   await _getAddress();
    // }).catchError((e) {
    //   print(e);
    // });
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
    // try {
    //   // List<Placemark> p = await placemarkFromCoordinates(
    //   //     _currentPosition.latitude, _currentPosition.longitude);

    //   // Placemark place = p[0];

    //   // setState(() {
    //   //   _currentAddress =
    //   //       "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
    //   //   startAddressController.text = _currentAddress;
    //   //   _startAddress = _currentAddress;
    //   // });
    // } catch (e) {
    //   print(e);
    // }
  }

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance() async {
    try {
      final GoogleMapController mapController = await _controller.future;
      // Retrieving placemarks from addresses
      // List<Location> startPlacemark = await locationFromAddress(_startAddress);
      // List<Location> destinationPlacemark =
      //     await locationFromAddress(_destinationAddress);

      if (_startPosition != null && _destinationPosition != null) {
        // Use the retrieved coordinates of the current position,
        // instead of the address if the start position is user's
        // current position, as it results in better accuracy.
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

        // Calculating the distance between the start and the end positions
        // with a straight path, without considering any route
        // double distanceInMeters = await Geolocator().bearingBetween(
        //   startCoordinates.latitude,
        //   startCoordinates.longitude,
        //   destinationCoordinates.latitude,
        //   destinationCoordinates.longitude,
        // );

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
    polylines[id] = polyline;
  }

  searchPlace(String searchText, String label) async {
    final places = await placeServices.getAutocomplete(searchText);
    setState(() {
      this.textLabel = label;
      this.searchResults = places;
    });
  }

  setSelectedLocation(String placeId, String name) async {
    var place = await placeServices.getPlace(placeId);
    selectedLocation.add(place);

    List<Marker> _marker = List<Marker>();
    _marker.add(placeServices.createMarkerFromPlace(place, false));

    var _bounds = placeServices.bounds(Set<Marker>.of(_marker));

    bounds.add(_bounds);

    var laln = Position(
        latitude: place.geometry.location.lat,
        longitude: place.geometry.location.lng);

    this.textLabel == "Start"
        ? _startPosition = laln
        : _destinationPosition = laln;
    //_startPosition
    //_destinationPosition

    setState(() {
      this.textLabel == "Start"
          ? startAddressController.text = name
          : destinationAddressController.text = name;
      this.marker = _marker;
      this.searchResults = null;
    });
  }

  @override
  void initState() {
    placeServices = PlaceServices.init();
    _getCurrentLocation();
    selectedLocation.stream.listen((place) {
      if (place != null) {
        _gotoPlace(place);
      }
    });
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
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),

            /*Positioned(
              top: 30.0,
              right: 15.0,
              left: 15.0,
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
              ),
            ),*/
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
            // Show the place input fields & button for
            // showing the route
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Places',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(height: 10),
                          _textField(
                              label: 'Start',
                              hint: 'Choose starting point',
                              prefixIcon: Icon(Icons.looks_one),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.my_location),
                                onPressed: () {
                                  startAddressController.text = _currentAddress;
                                  _startAddress = _currentAddress;
                                },
                              ),
                              controller: startAddressController,
                              focusNode: startAddressFocusNode,
                              width: width,
                              locationCallback: (String value) {
                                setState(() {
                                  _startAddress = value;
                                });
                              }),
                          SizedBox(height: 10),
                          _textField(
                              label: 'Destination',
                              hint: 'Choose destination',
                              prefixIcon: Icon(Icons.looks_two),
                              controller: destinationAddressController,
                              focusNode: desrinationAddressFocusNode,
                              width: width,
                              locationCallback: (String value) {
                                setState(() {
                                  _destinationAddress = value;
                                });
                              }),
                          SizedBox(height: 10),
                          Visibility(
                            visible: _placeDistance == null ? false : true,
                            child: Text(
                              ' 距離：$_distance \n 時間：$_duration \n 預估車資：$_totalPay 元 ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          RaisedButton(
                            onPressed: (_startPosition != null &&
                                    _destinationPosition != null)
                                ? () async {
                                    startAddressFocusNode.unfocus();
                                    desrinationAddressFocusNode.unfocus();
                                    setState(() {
                                      if (markers.isNotEmpty) markers.clear();
                                      if (polylines.isNotEmpty)
                                        polylines.clear();
                                      if (polylineCoordinates.isNotEmpty)
                                        polylineCoordinates.clear();
                                      _placeDistance = null;
                                    });

                                    _calculateDistance().then((isCalculated) {
                                      if (isCalculated) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Distance Calculated Sucessfully'),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Error Calculating Distance'),
                                          ),
                                        );
                                      }
                                    });
                                  }
                                : null,
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Show Route'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                          (_startPosition != null &&
                                  _destinationPosition != null)
                              ? Column(
                                  children: <Widget>[
                                    Btn(
                                      text: '下一步',
                                      color: Color.fromRGBO(7, 13, 89, 1),
                                      onPress: () {
                                        widget.dispatch.start =
                                            startAddressController.text
                                                .toString();
                                        widget.dispatch.end =
                                            destinationAddressController.text
                                                .toString();
                                        widget.dispatch.startLat =
                                            _startPosition.latitude;
                                        widget.dispatch.startLng =
                                            _startPosition.longitude;
                                        widget.dispatch.endLat =
                                            _destinationPosition.latitude;
                                        widget.dispatch.endLng =
                                            _destinationPosition.longitude;
                                        widget.dispatch.distance =
                                            _distance.split(" ").first;
                                        widget.dispatch.duration = int.parse(
                                            _duration.split(" ").first);
                                        widget.dispatch.totalPay = _totalPay;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => FormScreen(
                                              dispatch: widget.dispatch,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              : Column(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //----------------------------------------------
            this.textLabel != ""
                ? SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: this.textLabel == "Start" ? 105.0 : 165.0,
                          left: 45.0,
                          right: 45.0),
                      child: Stack(
                        children: <Widget>[
                          if (this.searchResults != null &&
                              this.searchResults.length != 0)
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.6),
                                backgroundBlendMode: BlendMode.darken,
                              ),
                            ),
                          if (this.searchResults != null)
                            Container(
                              height: 100,
                              child: ListView.builder(
                                itemCount: this.searchResults.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      this.searchResults[index].description,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onTap: () => setSelectedLocation(
                                        this.searchResults[index].placeId,
                                        this.searchResults[index].name),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  )
                : Text(""),
            // Show current location button
            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: ClipOval(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _gotoPlace(Place place) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target:
            LatLng(place.geometry.location.lat, place.geometry.location.lng),
        zoom: 18.0)));
  }
}
