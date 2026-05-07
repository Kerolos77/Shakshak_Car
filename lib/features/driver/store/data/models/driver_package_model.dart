class DriverPackageModel {
  final int id;
  final String name;
  final String? description;
  final int validDays;
  final double discountPercentage;
  final double? priceMoney;
  final int? pricePoints;
  final String? image;

  DriverPackageModel({
    required this.id,
    required this.name,
    this.description,
    required this.validDays,
    required this.discountPercentage,
    this.priceMoney,
    this.pricePoints,
    this.image,
  });

  factory DriverPackageModel.fromJson(Map<String, dynamic> json) {
    return DriverPackageModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      validDays: json['valid_days'],
      discountPercentage: double.tryParse(json['discount_percentage'].toString()) ?? 0.0,
      priceMoney: json['price_money'] != null ? double.tryParse(json['price_money'].toString()) : null,
      pricePoints: json['price_points'] != null ? int.tryParse(json['price_points'].toString()) : null,
      image: json['image'],
    );
  }
}
