part of 'contact_us_cubit.dart';

@immutable
sealed class ContactUsState {}

final class ContactUsInitial extends ContactUsState {}

final class ContactUsLoading extends ContactUsState {}

final class ContactUsSuccess extends ContactUsState {
  final ContactUsModel contactUsModel;

  ContactUsSuccess({required this.contactUsModel});
}

final class ContactUsFailure extends ContactUsState {
  final String errorMessage;

  ContactUsFailure({required this.errorMessage});
}

final class WriteUsLoading extends ContactUsState {}

final class WriteUsSuccess extends ContactUsState {
  final WriteUsModel writeUsModel;

  WriteUsSuccess({required this.writeUsModel});
}

final class WriteUsFailure extends ContactUsState {
  final String errorMessage;

  WriteUsFailure({required this.errorMessage});
}
