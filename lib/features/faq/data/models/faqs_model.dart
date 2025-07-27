class FaqsModel {
  FaqsModel({
    this.success,
    this.data,
    this.message,
  });

  FaqsModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Faq.fromJson(v));
      });
    }
    message = json['message'];
  }

  bool? success;
  List<Faq>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }
}

class Faq {
  Faq({
    this.id,
    this.title,
    this.description,
    this.createdAt,
  });

  Faq.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
  }

  int? id;
  String? title;
  String? description;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['created_at'] = createdAt;
    return map;
  }
}
