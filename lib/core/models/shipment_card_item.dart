class ShipmentCardItem {
  final String id;
  final String status;
  final List<ShipmentLocation> locations;
  final String? createdAt;

  // ignore: non_constant_identifier_names
  static final List<Map<String, dynamic>> STATUS = [
    {'default': 'default'},
    {'arrived ': 'arrived '},
    {'in-transit ': 'in-transit '},
  ];

  ShipmentCardItem(
      {required this.id,
      required this.status,
      required this.locations,
      this.createdAt});

  ShipmentCardItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        status = json['status'],
        locations = json['locations'],
        createdAt = json['createdAt'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'locations': locations,
        'createdAt': createdAt,
      };
}

class ShipmentLocation {
  final String name;
  final String address;
  final String contact;
  // final ShipmentContact contact;

  ShipmentLocation(
      {required this.name, required this.address, required this.contact});

  ShipmentLocation.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        address = json['address'],
        contact = json['contact'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'contact': contact,
      };
}

class ShipmentContact {
  final String name;
  final String phoneNumber;

  ShipmentContact({required this.name, required this.phoneNumber});

  ShipmentContact.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phoneNumber = json['phoneNumber'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'phoneNumber': phoneNumber,
      };
}
