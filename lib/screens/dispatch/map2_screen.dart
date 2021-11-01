import 'package:flutter/material.dart';
import 'package:ambulance_flutter/key/secrets.dart'; // Stores the Google Maps API Key
import 'package:google_directions_api/google_directions_api.dart';

class Map2View extends StatefulWidget {
  @override
  _Map2ViewState createState() => _Map2ViewState();
}

class _Map2ViewState extends State<Map2View> {
  void main() {
    DirectionsService.init(Secrets.API_KEY);

    final directinosService = DirectionsService();

    final request = DirectionsRequest(
      origin: 'New York',
      destination: 'San Francisco',
      travelMode: TravelMode.driving,
    );

    directinosService.route(request,
        (DirectionsResult response, DirectionsStatus status) {
      if (status == DirectionsStatus.ok) {
        //print(response.routes[0].legs[0].steps);
        //print(status);

        // do something with successful response
      } else {
        // do something with error response
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    main();
    return Container();
  }
}
