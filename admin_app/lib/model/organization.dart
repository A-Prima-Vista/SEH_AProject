class Organization {
  String? city;
  String? name;
  String? location;

  Organization({this.city, this.name, this.location});

  Organization.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    name = json['name'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['name'] = this.name;
    data['location'] = this.location;
    return data;
  }
}