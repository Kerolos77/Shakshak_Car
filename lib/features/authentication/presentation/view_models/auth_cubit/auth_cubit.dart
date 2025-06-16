import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shakshak/features/authentication/data/models/forget_password_model.dart';
import 'package:shakshak/features/authentication/data/models/new_password_model.dart';
import 'package:shakshak/features/authentication/data/repo/auth_repo.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/network/local/cache_helper.dart';
import '../../../data/models/login_body.dart';
import '../../../data/models/login_model.dart';
import '../../../data/models/logout_model.dart';
import '../../../data/models/otp_model.dart';
import '../../../data/models/profile_model.dart';
import '../../../data/models/signup_body.dart';
import '../../../data/models/signup_model.dart';
import '../../../data/models/update_profile_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  String roleSelection = '';

  bool loginPasswordVisible = true;

  bool newPassVisible = true;
  bool newPassConfirmVisible = true;

  bool registerPasswordVisible = true;

  bool isChecked = false;

  final AuthRepo authRepo;

  void selectRoleType(String method) {
    roleSelection = method;
    CacheHelper.saveData(
        key: AppConstant.kRoleSelection, value: int.parse(method));
    debugPrint(roleSelection);
    emit(RoleSelectionChangedState());
  }

  void changeLoginPasswordVisibility() {
    loginPasswordVisible = !loginPasswordVisible;
    emit(LoginChangePasswordVisabilityState());
  }

  void changeNewPasswordVisibility() {
    newPassVisible = !newPassVisible;
    emit(NewPassChangePasswordVisabilityState());
  }

  void changeNewPasswordConfirmVisibility() {
    newPassConfirmVisible = !newPassConfirmVisible;
    emit(NewPassChangePasswordConfirmVisabilityState());
  }

  void changeTermsAndPrivacyCheck() {
    isChecked = !isChecked;
    emit(TermsAndPrivacyCheckState());
  }

  void changeRegisterPasswordVisibility() {
    registerPasswordVisible = !registerPasswordVisible;
    emit(RegisterChangePasswordVisabilityState());
  }

  void login({required LoginBody loginBody}) async {
    emit(LoginLoadingState());
    var result = await authRepo.login(
      loginBody: loginBody,
    );
    result.fold((fail) {
      debugPrint("error while login ${fail.message}");
      emit(LoginErrorState(fail.message));
    }, (loginModel) {
      // print(loginModel.data!.token!);
      emit(LoginSuccessState(loginModel));
    });
  }

  void signup({required SignupBody signupBody}) async {
    emit(RegisterLoadingState());
    /* var result = await authRepo.signup(signupBody: signupBody);
    result.fold((fail) {
      debugPrint("error while signup ${fail.message}");
      emit(RegisterErrorState(fail.message));
    }, (registerModel) {
      emit(RegisterSuccessState(registerModel));
    });*/
  }

  void verifyPhone(
      {required String phone, required bool fromForgetPassword}) async {
    emit(VerifyPhoneLoadingState());
    /*  var result = fromForgetPassword
       ? await authRepo.forgetPassword(phone: phone)
        : await authRepo.verifyPhone(
            phone: phone,
            registerToken:
                CacheHelper.getData(key: AppConstant.kRegisterToken));
    result.fold((fail) {
      debugPrint("error while verify phone ${fail.message}");
      emit(VerifyPhoneErrorState(fail.message));
    }, (forgetPasswordModel) {
      emit(VerifyPhoneSuccessState(forgetPasswordModel));
    });*/
  }

  void verifyPhoneOtp({
    required int otpCode,
  }) async {
    emit(VerifyPhoneOTPLoadingState());
    /*var result = fromForgetPassword
        ? await authRepo.forgetPasswordOtp(otp: otpCode)
        : await authRepo.verifyPhoneOtp(
            otp: otpCode,
            registerToken:
                CacheHelper.getData(key: AppConstant.kRegisterToken));
    result.fold((fail) {
      debugPrint("error while verify phone otp ${fail.message}");
      emit(VerifyPhoneOTPErrorState(fail.message));
    }, (otpModel) {
      emit(VerifyPhoneOTPSuccessState(otpModel));
    });*/
  }

  void forgetPassword({required String phone}) async {
    emit(ForgetPasswordLoadingState());
    /* var result = await authRepo.forgetPassword(phone: phone);
    result.fold((fail) {
      debugPrint("error while forget password ${fail.message}");
      emit(ForgetPasswordErrorState(fail.message));
    }, (forgetPasswordModel) {
      emit(ForgetPasswordSuccessState(forgetPasswordModel));
    });*/
  }

  void forgetPasswordOtp({required int otpCode}) async {
    emit(ForgetPasswordOTPLoadingState());
    /* var result = await authRepo.verifyPhoneOtp(otp: otpCode);
    result.fold((fail) {
      debugPrint("error while forget password otp ${fail.message}");
      emit(ForgetPasswordOTPErrorState(fail.message));
    }, (otpModel) {
      emit(ForgetPasswordOTPSuccessState(otpModel));
    });*/
  }

  void newPassword({
    required int userId,
    required String password,
    required String confirmPassword,
  }) async {
    emit(NewPasswordLoadingStatue());
    /* var result = await authRepo.newPassword(
      userId: userId,
      password: password,
      confirmPassword: confirmPassword,
    );
    result.fold((fail) {
      debugPrint("error while new password ${fail.message}");
      emit(NewPasswordFailureStatue(fail.message));
    }, (forgetPasswordModel) {
      emit(NewPasswordSuccessStatue(forgetPasswordModel));
    });*/
  }

  void logout() async {
    emit(LogoutLoadingStatue());
    /*var result = await authRepo.logout();
    result.fold((fail) {
      debugPrint("error while logout ${fail.message}");
      emit(LogoutFailureStatue((fail.message)));
    }, (logoutModel) {
      CacheHelper.removeData(key: AppConstant.kToken);
      emit(LogoutSuccessStatue(logoutModel));
    });*/

/*  authRepo.logout();
    CacheHelper.removeData(key: 'token');
    CacheHelper.removeData(key: 'name'); */
  }

  void getProfile() async {
    emit(GetProfileLoadingState());
    /* var result = await authRepo.getProfile();
    result.fold((error) {
      debugPrint("error while get profile data ${error.message}");
      return emit(GetProfileFailureState(errMessage: error.message));
    }, (success) {
      return emit(GetProfileSuccessState(success));
    });*/
  }

  void updateProfile({
    required String name,
    required String phone,
    required String email,
  }) async {
    emit(UpdateProfileLoadingState());
    /*var result = await authRepo.updateProfile(
      name: name,
      phone: phone,
      email: email,
    );
    result.fold((fail) {
      debugPrint("error while update profile ${fail.message}");
      emit(UpdateProfileFailureState(errMessage: fail.message));
    }, (loginModel) {
      emit(UpdateProfileSuccessState(loginModel));
    });*/
  }

  void deleteAccount() async {
    emit(DeleteProfileLoadingState());
    /* var result = await authRepo.deleteAccount();
    result.fold((fail) {
      debugPrint("error while delete account ${fail.message}");
      emit(DeleteProfileFailureState(fail.message));
    }, (loginModel) {
      emit(DeleteProfileSuccessState(loginModel));
    });*/
  }
}
