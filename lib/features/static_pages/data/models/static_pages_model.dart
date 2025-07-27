class StaticPagesModel {
  StaticPagesModel({
    this.success,
    this.data,
    this.message,
  });

  StaticPagesModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  bool? success;
  Data? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.slug,
    this.content,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    content = json['content'];
  }

  int? id;
  String? name;
  String? slug;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['content'] = content;
    return map;
  }
}
