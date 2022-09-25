class LogInModel {
  LogInModel(
    this.success,
    this.data,
    this.message,
  );
  late final bool success;
  late final Data? data;
  late final String message;

  LogInModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  Data(
    this.token,
    this.name,
    this.email,
    this.hasMedia,
    this.media,
  );
  late final String token;
  late final String name;
  late final String email;
  late final bool hasMedia;
  late final String media;

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    email = json['email'];
    hasMedia = json['has_media'];
    media = json['media'];
  }
}
