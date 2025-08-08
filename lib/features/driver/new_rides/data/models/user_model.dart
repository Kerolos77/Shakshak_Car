class PersonModel {
  final String? id;
  final String? name;
  final String? phone;
  final String? image;
  final String? countryId;
  final String? city;
  final String? email;
  final String? walletAmount;
  final String? pendingWallet;
  final String? driverStatus;
  final String? isDriver;
  final String? isOnline;
  final String? serviceId;

  PersonModel({
     this.id,
     this.name,
     this.phone,
     this.image,
     this.countryId,
     this.city,
     this.email,
     this.walletAmount,
     this.pendingWallet,
     this.driverStatus,
     this.isDriver,
     this.isOnline,
     this.serviceId,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'].toString(),
      name: json['name'].toString(),
      phone: json['phone'].toString(),
      image: json['image'].toString(),
      countryId: json['country_id'].toString(),
      city: json['city'].toString(),
      email: json['email'].toString(),
      walletAmount: json['wallet_amount'].toString(),
      pendingWallet: json['pending_wallet'].toString(),
      driverStatus: json['driver_status'].toString(),
      isDriver: json['is_driver'].toString(),
      isOnline: json['is_online'].toString(),
      serviceId: json['service_id'].toString(),
    );
  }
}
