part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

// role selection
class RoleSelectionChangedState extends AuthState {}

final class AuthChangeBody extends AuthState {}

// register
class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final SignupModel userModel;

  RegisterSuccessState(this.userModel);
}

class RegisterErrorState extends AuthState {
  final String errorMsg;

  RegisterErrorState(this.errorMsg);
}

class RegisterChangePasswordVisabilityState extends AuthState {}

// login
class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final LoginModel userModel;

  LoginSuccessState(this.userModel);
}

class LoginErrorState extends AuthState {
  final String errorMsg;

  LoginErrorState(this.errorMsg);
}

class LoginChangeCompleteNumberStatue extends AuthState {}

class LoginChangePasswordVisabilityState extends AuthState {}

class NewPassChangePasswordVisabilityState extends AuthState {}

class NewPassChangePasswordConfirmVisabilityState extends AuthState {}

class TermsAndPrivacyCheckState extends AuthState {}

// logout
class LogoutLoadingStatue extends AuthState {}

class LogoutFailureStatue extends AuthState {
  final String errorMsg;

  LogoutFailureStatue(this.errorMsg);
}

class LogoutSuccessStatue extends AuthState {
  final LogoutModel userModel;

  LogoutSuccessStatue(this.userModel);
}

// Forget password
class ForgetPasswordLoadingState extends AuthState {}

class ForgetPasswordSuccessState extends AuthState {
  final ForgetPasswordModel userModel;

  ForgetPasswordSuccessState(this.userModel);
}

class ForgetPasswordErrorState extends AuthState {
  final String errorMsg;

  ForgetPasswordErrorState(this.errorMsg);
}

// verify phone
class VerifyPhoneLoadingState extends AuthState {}

class VerifyPhoneSuccessState extends AuthState {
  final ForgetPasswordModel userModel;

  VerifyPhoneSuccessState(this.userModel);
}

class VerifyPhoneErrorState extends AuthState {
  final String errorMsg;

  VerifyPhoneErrorState(this.errorMsg);
}

//Verify Phone OTP
class VerifyPhoneOTPLoadingState extends AuthState {}

class VerifyPhoneOTPSuccessState extends AuthState {
  final ProfileModel profileModel;

  VerifyPhoneOTPSuccessState(this.profileModel);
}

class VerifyPhoneOTPErrorState extends AuthState {
  final String errorMsg;

  VerifyPhoneOTPErrorState(this.errorMsg);
}

//  Forget Password OTP
class ForgetPasswordOTPLoadingState extends AuthState {}

class ForgetPasswordOTPSuccessState extends AuthState {
  final OtpModel userModel;

  ForgetPasswordOTPSuccessState(this.userModel);
}

class ForgetPasswordOTPErrorState extends AuthState {
  final String errorMsg;

  ForgetPasswordOTPErrorState(this.errorMsg);
}

// new password
class NewPasswordLoadingStatue extends AuthState {}

class NewPasswordFailureStatue extends AuthState {
  final String errorMsg;

  NewPasswordFailureStatue(this.errorMsg);
}

class NewPasswordSuccessStatue extends AuthState {
  final NewPasswordModel userModel;

  NewPasswordSuccessStatue(this.userModel);
}

// get profile
class GetProfileLoadingState extends AuthState {}

class GetProfileSuccessState extends AuthState {
  final ProfileModel userModel;

  GetProfileSuccessState(this.userModel);
}

class GetProfileFailureState extends AuthState {
  final String errMessage;

  GetProfileFailureState({required this.errMessage});
}

// update Profile
class UpdateProfileLoadingState extends AuthState {}

class UpdateProfileSuccessState extends AuthState {
  final UpdateProfileModel userModel;

  UpdateProfileSuccessState(this.userModel);
}

class UpdateProfileFailureState extends AuthState {
  final String errMessage;

  UpdateProfileFailureState({required this.errMessage});
}
// delete account

class DeleteProfileLoadingState extends AuthState {}

class DeleteProfileSuccessState extends AuthState {
  final ProfileModel profileModel;

  DeleteProfileSuccessState(this.profileModel);
}

class DeleteProfileFailureState extends AuthState {
  final String errorMsg;

  DeleteProfileFailureState(this.errorMsg);
}
