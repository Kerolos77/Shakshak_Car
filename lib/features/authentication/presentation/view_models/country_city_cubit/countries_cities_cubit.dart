import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shakshak/features/authentication/data/models/country_model.dart';
import 'package:shakshak/features/authentication/data/repo/auth_repo.dart';

import '../../../data/models/city_model.dart';

part 'countries_cities_state.dart';

class CountriesCitiesCubit extends Cubit<CountriesCitiesState> {
  CountriesCitiesCubit(this.authRepo) : super(CountryCityInitial());
  final AuthRepo authRepo;

  int? selectedCountryId;
  int? selectedCityId;
  int? selectedCitiesDistricts;

  Future<void> getCountries() async {
    emit(CountryLoading());
    var result = await authRepo.getCountries();
    result.fold((error) {
      debugPrint("error while get countries data ${error.message}");
      return emit(CountryFailure(errorMessage: error.message));
    }, (success) {
      return emit(CountrySuccess(countriesModel: success));
    });
  }

  Future<void> getCities({required int countryId}) async {
    emit(CitiesLoading());
    var result = await authRepo.getCities(countryId: countryId);
    result.fold((error) {
      debugPrint("error while get cities data ${error.message}");
      return emit(CitiesFailure(errorMessage: error.message));
    }, (success) {
      return emit(CitiesSuccess(citiesModel: success));
    });
  }
}
