class UpdatePasswordModel {
  UpdatePasswordModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final List<dynamic>? data;
  late final String message;

  UpdatePasswordModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'];
    // ? json['data'] : null;
    message = json['message'];
  }
}
