import 'dart:convert';

class LocationData {
  final double lat, long;

  const LocationData({required this.lat, required this.long});

  factory LocationData.fromJson(String json) {
    final data = jsonDecode(json) as Map<String, dynamic>;
    return LocationData(lat: data['lat'], long: data['long']);
  }

  String toJson() => jsonEncode({'lat': lat, 'long': long});
}
