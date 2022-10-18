class MarketSettingsSetModel {
  MarketSettingsSetModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool success;
  late final List<dynamic> data;
  late final String message;

  MarketSettingsSetModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data;
    _data['message'] = message;
    return _data;
  }
}
