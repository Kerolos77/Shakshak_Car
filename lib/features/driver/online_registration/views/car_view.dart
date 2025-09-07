import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_drop_down.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';
import 'package:shakshak/features/user_home/presentation/widgets/select_vehicle_section.dart';
import 'package:shakshak/generated/l10n.dart';

import '../../../../core/router/router_helper.dart';
import '../../vehicle_information/presentation/widgets/car_model_drop_down.dart';
import '../presentation/view_models/driver_registration_cubit.dart';

class CarView extends StatefulWidget {
  const CarView({super.key});

  @override
  State<CarView> createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  final TextEditingController _carNumberController = TextEditingController();
  final TextEditingController _carColorController = TextEditingController();
  String? selectedBrand;
  String? selectedYear;
  String? selectedModel;

  @override
  void initState() {
    super.initState();
    // Initialize with stored data if available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<DriverRegistrationCubit>();
      if (cubit.storedCarNumber != null) {
        setState(() {
          _carNumberController.text = cubit.storedCarNumber!;
        });
      }
      if (cubit.storedCarColor != null) {
        setState(() {
          _carColorController.text = cubit.storedCarColor!;
        });
      }
      setState(() {
        selectedBrand = cubit.storedCarBrand;
        selectedYear = cubit.storedCarYear;
        selectedModel = cubit.storedCarModel;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverRegistrationCubit, DriverRegistrationState>(
      listener: (context, state) {
        if (state is CarImageStoredState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Car information stored successfully'),
              backgroundColor: Colors.green,
            ),
          );
          navigatePop(context);
        }
      },
      builder: (context, state) {
        return BaseLayoutView(
          title: S.of(context).car,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SelectVehicleSection(),
                12.ph,
                CustomTextField(
                  controller: _carNumberController,
                  label: S.of(context).carNumber,
                  hint: S.of(context).carNumber,
                  keyType: TextInputType.number,
                  onchange: (value) {
                    context
                        .read<DriverRegistrationCubit>()
                        .storeCarNumber(value ?? '');
                  },
                ),
                12.ph,
                CustomDropDown(
                  label: S.of(context).carBrand,
                  hint: S.of(context).carBrand,
                  items: ['1', '2'],
                  value: selectedBrand,
                  onChange: (value) {
                    setState(() {
                      selectedBrand = value;
                    });
                    context
                        .read<DriverRegistrationCubit>()
                        .storeCarBrand(value ?? '');
                  },
                ),
                12.ph,
                YearsDropDown(
                  selectedValue: selectedYear,
                  onYearChanged: (value) {
                    setState(() {
                      selectedYear = value;
                    });
                    context
                        .read<DriverRegistrationCubit>()
                        .storeCarYear(value ?? '');
                  },
                ),
                12.ph,
                CustomDropDown(
                  label: S.of(context).carModel,
                  hint: S.of(context).carModel,
                  items: ['1', '2'],
                  value: selectedModel,
                  onChange: (value) {
                    setState(() {
                      selectedModel = value;
                    });
                    context
                        .read<DriverRegistrationCubit>()
                        .storeCarModel(value ?? '');
                  },
                ),
                12.ph,
                CustomTextField(
                  controller: _carColorController,
                  label: S.of(context).carColor,
                  hint: S.of(context).carColor,
                  onchange: (value) {
                    context
                        .read<DriverRegistrationCubit>()
                        .storeCarColor(value ?? '');
                  },
                ),
                24.ph,
                CustomButton(
                  text: 'Done',
                  onTap: () {
                    // Store car data and navigate back
                    navigatePop(context);
                  },
                ),
                12.ph,
              ],
            ),
          ),
        );
      },
    );
  }
}
