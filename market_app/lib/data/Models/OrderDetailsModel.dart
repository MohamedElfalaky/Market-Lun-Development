class OrderDetailsModel {
  OrderDetailsModel(
    this.success,
    this.data,
    this.message,
  );
  late final bool success;
  late final Data data;
  late final String message;

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }
}

class Data {
  Data({
    required this.clientName,
    required this.clientPhone,
    required this.hint,
    required this.address,
    required this.orderType,
    required this.status,
    required this.orderId,
    required this.time,
    required this.orderStatusId,
    required this.driverName,
    this.preparingTime,
    this.expiredAt,
    required this.updatedAt,
    required this.payment,
    required this.products,
    required this.timezone,
  });
  late final String clientName;
  late final String clientPhone;
  late final String hint;
  late final String address;
  late final String orderType;
  late final String status;
  late final int orderId;
  late final int time;
  late final int orderStatusId;
  late final String driverName;
  late final String? preparingTime;
  late final String? expiredAt;
  late final String updatedAt;
  late final Payment payment;
  late final List<Products> products;
  late final String timezone;

  Data.fromJson(Map<String, dynamic> json) {
    clientName = json['client_name'];
    clientPhone = json['client_phone'];
    hint = json['hint'];
    address = json['address'];
    orderType = json['order_type'];
    status = json['status'];
    orderId = json['order_id'];
    time = json['time '];
    orderStatusId = json['order_status_id'];
    driverName = json['driver_name'];
    preparingTime = json['preparing_time'];
    expiredAt = json['expired_at'];
    updatedAt = json['updated_at'];
    payment = Payment.fromJson(json['payment']);
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
    timezone = json['timezone'];
  }
}

class Payment {
  Payment({
    required this.price,
    required this.method,
    required this.deliveryFee,
    required this.subtotal,
  });
  late final int price;
  late final String method;
  late final int deliveryFee;
  late final num subtotal;

  Payment.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    method = json['method'];
    deliveryFee = json['delivery_fee'];
    subtotal = json['subtotal'];
  }
}

class Products {
  Products({
    required this.id,
    required this.name,
    required this.quantity,
    required this.total,
    required this.options,
  });
  late final int id;
  late final String name;
  late final int quantity;
  late final num total;
  late final List<String> options;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    total = json['total'];
    options = List.castFrom<dynamic, String>(json['options']);
  }
}
