class UpdateOrderModel {
  UpdateOrderModel(
    this.success,
    this.data,
    this.message,
  );
  late final bool success;
  late final List<dynamic>? data;
  late final String message;

  UpdateOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null
        ? List.castFrom<dynamic, dynamic>(json['data'])
        : null;
    message = json['message'];
  }
}
