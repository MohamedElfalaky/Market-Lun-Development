class LogOutModel {
  LogOutModel(
    this.success,
    this.data,
    this.message,
  );
  late final bool success;
  late final String? data;
  late final String message;

  LogOutModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'];
    message = json['message'];
  }
}
