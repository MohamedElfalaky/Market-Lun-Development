class DriversModel {
  DriversModel(
    this.success,
    this.data,
    this.message,
  );
  late final bool success;
  late final List<Dataa> data;
  late final String message;

  DriversModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = List.from(json['data']).map((e) => Dataa.fromJson(e)).toList();
    message = json['message'];
  }
}

class Dataa {
  Dataa({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Dataa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
