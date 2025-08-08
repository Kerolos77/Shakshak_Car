import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shakshak/features/authentication/data/repo/auth_repo.dart';

import '../../../../../core/constants/app_const.dart';
import '../../../../../core/network/local/cache_helper.dart';
import '../../../data/models/login_body.dart';
import '../../../data/models/login_model.dart';
import '../../../data/models/profile_model.dart';
import '../../../data/models/signup_body.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  String roleSelection = '';
  String completeNumber = '';

  bool loginPasswordVisible = true;

  bool newPassVisible = true;
  bool newPassConfirmVisible = true;

  bool registerPasswordVisible = true;

  bool isChecked = false;

  final AuthRepo authRepo;

  void selectRoleType(String method) {
    roleSelection = method;
    CacheHelper.saveData(key: AppConstant.kRoleSelection, value: method);
    debugPrint(roleSelection);
    emit(RoleSelectionChangedState());
  }

  void changeCompleteNumber({required String completeNumber}) {
    this.completeNumber = completeNumber;
    emit(LoginChangeCompleteNumberStatus());
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
    var result = await authRepo.signup(signupBody: signupBody);
    result.fold((fail) {
      debugPrint("error while signup ${fail.message}");
      emit(RegisterErrorState(fail.message));
    }, (registerModel) {
      emit(RegisterSuccessState(registerModel));
    });
  }

  void verifyPhoneOtp({
    required int otpCode,
  }) async {
    emit(VerifyPhoneOTPLoadingState());
    var result = await authRepo.verifyPhoneOtp(otp: otpCode.toString());
    result.fold((fail) {
      debugPrint("error while verify phone otp ${fail.message}");
      emit(VerifyPhoneOTPErrorState(fail.message));
    }, (profileModel) {
      emit(VerifyPhoneOTPSuccessState(profileModel));
    });
  }

  void logout() async {
    CacheHelper.removeData(key: AppConstant.kToken);
    CacheHelper.removeData(key: AppConstant.kIsDriver);
    CacheHelper.removeData(key: AppConstant.kUserIdOtp);
  }

  void getProfile() async {
    emit(GetProfileLoadingState());
    var result = await authRepo.getProfile();
    result.fold((error) {
      debugPrint("error while get profile data${error.message}");
      return emit(GetProfileFailureState(errMessage: error.message));
    }, (success) {
      return emit(GetProfileSuccessState(success));
    });
  }

  void updateProfile({
    required String name,
    required String email,
    required int countryId,
    required int cityId,
    File? photo,
  }) async {
    emit(UpdateProfileLoadingState());
    var result = photo != null
        ? await authRepo.updateProfile(
            name: name,
            email: email,
            countryId: countryId,
            cityId: cityId,
            photo: photo,
          )
        : await authRepo.updateProfile(
            name: name,
            email: email,
            countryId: countryId,
            cityId: cityId,
          );
    result.fold((fail) {
      debugPrint("error while update profile ${fail.message}");
      emit(UpdateProfileFailureState(errMessage: fail.message));
    }, (loginModel) {
      emit(UpdateProfileSuccessState(loginModel));
    });
  }
}
