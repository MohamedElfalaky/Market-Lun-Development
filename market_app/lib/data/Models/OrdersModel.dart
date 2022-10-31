class OrdersModel {
  OrdersModel(
    this.success,
    this.data,
    this.message,
  );
  late final bool success;
  late final List<Data> data;
  late final String message;

  OrdersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    message = json['message'];
  }
}

class Data {
  Data({
    required this.orderId,
    required this.clientName,
    required this.driverName,
    required this.receiveMethod,
    required this.total,
    required this.paymentMethod,
    required this.orderStatus,
    this.preparingTime,
    this.expiredAt,
    required this.orderStatusId,
    required this.timezone,
  });
  late final int orderId;
  late final String clientName;
  late final String driverName;
  late final String receiveMethod;
  late final num total;
  late final String paymentMethod;
  late final String orderStatus;
  late final String? preparingTime;
  late final dynamic expiredAt;
  late final int orderStatusId;
  late final String timezone;

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    clientName = json['client_name'];
    driverName = json['driver_name'];
    receiveMethod = json['receive_method'];
    total = json['total'];
    paymentMethod = json['payment_method'];
    orderStatus = json['order_status'];
    preparingTime = json['preparing_time'];
    expiredAt = json['expired_at'];
    orderStatusId = json['order_status_id'];
    timezone = json['timezone'];
  }
}
