class NotificationsModel {
  NotificationsModel(
    this.success,
    this.data,
    this.message,
  );
  late final bool success;
  late final List<Data> data;
  late final String message;

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    message = json['message'];
  }
}

class Data {
  Data(
    this.title,
    this.body,
    this.date,
    this.id,
  );
  late final String title;
  late final String body;
  late final String date;
  late final String id;
  // late final User user;

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    date = json['date'];
    id = json['id'];
  }
}
