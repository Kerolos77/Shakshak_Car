import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/shared_widgets/custom_drop_down.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../view_models/country_city_cubit/countries_cities_cubit.dart';

class CitiesDropDown extends StatefulWidget {
  final Function(int)? onCountrySelected;
  final Function(int)? onCitySelected;
  final Function(int)? onDistrictSelected;

  const CitiesDropDown({
    super.key,
    this.onCountrySelected,
    this.onCitySelected,
    this.onDistrictSelected,
  });

  @override
  State<CitiesDropDown> createState() => _CitiesDropDownState();
}

class _CitiesDropDownState extends State<CitiesDropDown> {
  @override
  void initState() {
    super.initState();

    context.read<CountriesCitiesCubit>().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CountriesCitiesCubit, CountriesCitiesState>(
          buildWhen: (previous, current) =>
              current is CountryLoading ||
              current is CountrySuccess ||
              current is CountryFailure,
          builder: (context, state) {
            CountriesCitiesCubit cubit = context.read<CountriesCitiesCubit>();
            if (state is CountryLoading) {
              return Skeletonizer(
                child: CustomDropDown(
                  hint: S.of(context).selectCountry,
                  prefix: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: SvgPicture.asset(Assets.svgLocation),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).countryIsRequired;
                    }
                    return null;
                  },
                  items: const [],
                ),
              );
            } else if (state is CountrySuccess) {
              final countries = state.countriesModel.data!;
              final List<String> countryNames = state.countriesModel.data!
                  .map((country) => country.name)
                  .where((name) => name != null)
                  .cast<String>()
                  .toList();
              return CustomDropDown(
                hint: S.of(context).selectCountry,
                prefix: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: SvgPicture.asset(Assets.svgLocation),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).countryIsRequired;
                  }
                  return null;
                },
                items: countryNames,
                onChange: (countryName) {
                  final selectedCountry = countries
                      .firstWhere((country) => country.name == countryName);
                  cubit.getCities(countryId: selectedCountry.id!);
                  cubit.selectedCountryId = selectedCountry.id;

                  // Call the country selection callback if provided
                  if (widget.onCountrySelected != null &&
                      selectedCountry.id != null) {
                    widget.onCountrySelected!(selectedCountry.id!);
                  }
                },
              );
            } else if (state is CitiesFailure) {
              return Text(state.errorMessage);
            } else {
              return const SizedBox();
            }
          },
        ),
        16.ph,
        BlocBuilder<CountriesCitiesCubit, CountriesCitiesState>(
          buildWhen: (previous, current) =>
              current is CitiesLoading ||
              current is CitiesSuccess ||
              current is CitiesFailure,
          builder: (context, state) {
            CountriesCitiesCubit cubit = context.read<CountriesCitiesCubit>();
            if (state is CitiesLoading) {
              return Skeletonizer(
                child: CustomDropDown(
                  hint: S.of(context).selectCity,
                  prefix: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: SvgPicture.asset(Assets.svgLocation),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).cityIsRequired;
                    }
                    return null;
                  },
                  items: const [],
                ),
              );
            } else if (state is CitiesSuccess) {
              final countries = state.citiesModel.data!;
              final List<String> countryNames = state.citiesModel.data!
                  .map((country) => country.name)
                  .where((name) => name != null)
                  .cast<String>()
                  .toList();
              return countries.isNotEmpty
                  ? CustomDropDown(
                      hint: S.of(context).selectCity,
                      prefix: Padding(
                        padding: EdgeInsets.all(8.r),
                        child: SvgPicture.asset(Assets.svgLocation),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).cityIsRequired;
                        }
                        return null;
                      },
                      items: countryNames,
                      onChange: (countryName) {
                        final selectedCountry = countries.firstWhere(
                            (country) => country.name == countryName);
                        cubit.selectedCityId = selectedCountry.id;

                        // Call the country selection callback if provided
                        if (widget.onCitySelected != null &&
                            selectedCountry.id != null) {
                          widget.onCitySelected!(selectedCountry.id!);
                        }
                      },
                    )
                  : SizedBox();
            } else if (state is CitiesFailure) {
              return Text(state.errorMessage);
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
