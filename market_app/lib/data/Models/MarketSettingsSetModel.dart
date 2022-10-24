class MarketSettingsSetModel {
  MarketSettingsSetModel(
     this.success,
     this.data,
     this.message,
  );
  late final bool success;
  late final List<dynamic> data;
  late final String message;

  MarketSettingsSetModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
    message = json['message'];
  }


}
