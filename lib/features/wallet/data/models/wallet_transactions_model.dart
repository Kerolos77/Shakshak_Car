class WalletTransactionsModel {
  WalletTransactionsModel({
    this.data,
    this.msg,
    this.status,
    this.statusval,
  });

  WalletTransactionsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(WalletTransactionData.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
    statusval = json['statusval'];
  }

  List<WalletTransactionData>? data;
  String? msg;
  int? status;
  bool? statusval;
}

class WalletTransactionData {
  WalletTransactionData({
    this.id,
    this.paymentId,
    this.status,
    this.success,
    this.amount,
    this.paymentMethod,
    this.paymentGateway,
    this.userID,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.note,
  });

  WalletTransactionData.fromJson(dynamic json) {
    id = json['id'];
    paymentId = json['payment_id'];
    status = json['status'];
    success = json['success'];
    amount = json['amount'];
    paymentMethod = json['payment_method'];
    paymentGateway = json['payment_gateway'];
    userID = json['userID'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    note = json['note'];
  }

  int? id;
  String? paymentId;
  String? status;
  int? success;
  String? amount;
  String? paymentMethod;
  String? paymentGateway;
  int? userID;
  String? createdAt;
  String? updatedAt;
  String? type;
  dynamic note;
}
