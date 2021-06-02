import 'dart:convert';
import 'package:ambulance_flutter/models/maps/direction.dart';
import 'package:ambulance_flutter/models/place.dart';
import 'package:ambulance_flutter/models/place_search.dart';
import 'package:ambulance_flutter/key/secrets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class PlaceServices {
  static PlaceServices _init = new PlaceServices.init();
  PlaceServices.init();
  factory PlaceServices() => _init;

  String key = Secrets.API_KEY;

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    final queryParameters = {
      'input': search,
      'key': key,
    };
    Uri uri = Uri.https('maps.googleapis.com',
        '/maps/api/place/autocomplete/json', queryParameters);

    http.Response response = await http.get(uri);
    var json = jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    final queryParameters = {
      'place_id': placeId,
      'key': key,
    };
    Uri uri = Uri.https(
        'maps.googleapis.com', '/maps/api/place/details/json', queryParameters);

    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }

  Future<Direction> getDirections(String origin, String destination) async {
    final queryParameters = {
      'origin': origin,
      'destination': destination,
      'key': key,
    };
    Uri uri = Uri.https(
        'maps.googleapis.com', '/maps/api/directions/json', queryParameters);

    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var jsonResult = json['routes']['legs'] as Map<String, dynamic>;
    return Direction.fromJson(jsonResult);
  }

  LatLngBounds bounds(Set<Marker> markers) {
    if (markers == null || markers.isEmpty) return null;
    return createBounds(markers.map((m) => m.position).toList());
  }

  LatLngBounds createBounds(List<LatLng> positions) {
    final southwestLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value < element ? value : element); // smallest
    final southwestLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value < element ? value : element);
    final northeastLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value > element ? value : element); // biggest
    final northeastLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value > element ? value : element);
    return LatLngBounds(
        southwest: LatLng(southwestLat, southwestLon),
        northeast: LatLng(northeastLat, northeastLon));
  }

  Marker createMarkerFromPlace(Place place, bool center) {
    var markerId = place.name;
    if (center) markerId = 'center';

    return Marker(
        markerId: MarkerId(markerId),
        draggable: false,
        visible: (center) ? false : true,
        infoWindow: InfoWindow(title: place.name, snippet: place.vicinity),
        position:
            LatLng(place.geometry.location.lat, place.geometry.location.lng));
  }
}
