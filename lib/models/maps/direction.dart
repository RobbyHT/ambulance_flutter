import '../location.dart';
import 'direction_step.dart';

class Direction {
  final String distance;
  final String duration;
  final Location start_location;
  final Location end_location;
  final DirectionStep steps;

  Direction(
      {this.distance,
      this.duration,
      this.start_location,
      this.end_location,
      this.steps});

  factory Direction.fromJson(Map<String, dynamic> json) {
    return Direction(
      distance: json['distance']['text'],
      duration: json['duration']['text'],
      start_location: Location.fromJson(json['start_location']),
      end_location: Location.fromJson(json['end_location']),
      steps: DirectionStep.fromJson(json['steps']),
    );
  }
}
