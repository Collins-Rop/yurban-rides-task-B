class County {
  final String id;
  final String name;

  County({required this.id, required this.name});

  factory County.fromJson(Map<String, dynamic> json) {
    return County(
      id: json['id'].toString(),
      name: json['name'].toString(),
    );
  }
}

class SubCounty {
  final String id;
  final String name;
  final String countyId;

  SubCounty({
    required this.id,
    required this.name,
    required this.countyId,
  });

  factory SubCounty.fromJson(Map<String, dynamic> json) {
    return SubCounty(
      id: json['id'].toString(),
      name: json['name'].toString(),
      countyId: json['county_id'].toString(),
    );
  }
}
