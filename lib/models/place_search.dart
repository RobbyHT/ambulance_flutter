class PlaceSearch {
  final String description;
  final String name;
  final String placeId;

  PlaceSearch({this.description, this.name, this.placeId});

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(
        description: json['description'],
        name: json['structured_formatting']['main_text'],
        placeId: json['place_id']);
  }
}
