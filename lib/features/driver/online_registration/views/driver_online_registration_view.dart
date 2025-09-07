import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/resources/app_colors.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/core/router/routes.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../generated/l10n.dart';
import '../presentation/view_models/driver_registration_cubit.dart';
import '../widgets/custom_online_registration_item.dart';

class DriverOnlineRegistrationView extends StatefulWidget {
  const DriverOnlineRegistrationView({super.key});

  @override
  State<DriverOnlineRegistrationView> createState() =>
      _DriverOnlineRegistrationViewState();
}

class _DriverOnlineRegistrationViewState
    extends State<DriverOnlineRegistrationView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with stored birth date if available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<DriverRegistrationCubit>();
      if (cubit.storedNationalIdBirthDate != null) {
        setState(() {
          _controller.text = cubit.storedNationalIdBirthDate!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DriverRegistrationCubit, DriverRegistrationState>(
      listener: (context, state) {
        if (state is DriverRegistrationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.driverRegistrationModel.message ??
                  'Registration submitted successfully'),
              backgroundColor: Colors.green,
            ),
          );
          // Navigate back or to success screen
        } else if (state is DriverRegistrationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return BaseLayoutView(
          title: S.of(context).onlineRegistration,
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  controller: _controller,
                  hint: S.of(context).nationalIdBirthDate,
                  isReadOnly: true,
                  suffix: Icon(
                    Icons.calendar_month,
                    color: AppColors.darkGreyColor,
                    size: 26.r,
                  ),
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      _controller.text =
                          pickedDate.toLocal().toString().split(' ')[0];
                      context
                          .read<DriverRegistrationCubit>()
                          .storeNationalIdBirthDate(_controller.text);
                    }
                  },
                ),
                18.ph,
                CustomOnlineRegistrationItem(
                  title: S.of(context).criminalRecord,
                  onTap: () {
                    navigateTo(context, Routes.criminalRecordView);
                  },
                ),
                18.ph,
                CustomOnlineRegistrationItem(
                  title: S.of(context).nationalId,
                  onTap: () {
                    navigateTo(context, Routes.nationalIdView);
                  },
                ),
                18.ph,
                CustomOnlineRegistrationItem(
                  title: S.of(context).licence,
                  onTap: () {
                    navigateTo(context, Routes.licenceView);
                  },
                ),
                18.ph,
                CustomOnlineRegistrationItem(
                  title: S.of(context).carLicence,
                  onTap: () {
                    navigateTo(context, Routes.carLicenceView);
                  },
                ),
                18.ph,
                CustomOnlineRegistrationItem(
                  title: S.of(context).car,
                  onTap: () {
                    navigateTo(context, Routes.carView);
                  },
                ),
                30.ph,
                CustomButton(
                  text: state is DriverRegistrationLoading
                      ? 'Submitting...'
                      : S.of(context).sendDocs,
                  onTap: state is DriverRegistrationLoading
                      ? null
                      : () {
                          context
                              .read<DriverRegistrationCubit>()
                              .submitDriverRegistration();
                        },
                ),
                18.ph,
              ],
            ),
          ),
        );
      },
    );
  }
}
