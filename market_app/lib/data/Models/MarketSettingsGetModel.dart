class MarketSettingsGetModel {
  MarketSettingsGetModel(
    this.success,
    this.data,
    this.message,
  );
  late final bool success;
  late final Data? data;
  late final String message;

  MarketSettingsGetModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }
}

class Data {
  Data({
    required this.marketStatus,
    required this.receiveMethod,
  });
  late final int marketStatus;
  late final ReceiveMethod receiveMethod;

  Data.fromJson(Map<String, dynamic> json) {
    marketStatus = json['market_status'];
    receiveMethod = ReceiveMethod.fromJson(json['receive_method']);
  }
}

class ReceiveMethod {
  ReceiveMethod({
    required this.delivery,
    required this.pickup,
  });
  late final int delivery;
  late final int pickup;

  ReceiveMethod.fromJson(Map<String, dynamic> json) {
    delivery = json['delivery'];
    pickup = json['pickup'];
  }
}
