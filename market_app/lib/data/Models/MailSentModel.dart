class MailSentModel {
  MailSentModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final bool data;
  late final String message;

  MailSentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'];
    message = json['message'];
  }
}
