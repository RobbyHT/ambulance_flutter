class DirectionStep {
  final String points;

  DirectionStep({this.points});

  factory DirectionStep.fromJson(Map<String, dynamic> json) {
    return DirectionStep(points: json['polyline']['points']);
  }
}
