import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_button.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_drop_down.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_text_field.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/base_layout/presentation/views/base_layout_view.dart';

import '../../../../core/utils/shared_widgets/select_location/select_location.dart';
import '../../../../generated/l10n.dart';
import '../view_models/user_home_cubit/user_home_cubit.dart';
import '../view_models/user_home_cubit/user_home_states.dart';
import '../widgets/captions_widget.dart';
import '../widgets/select_vehicle_section.dart';
import '../widgets/user_home_header.dart';

class UserHomeView extends StatefulWidget {
  UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserHomeCubit, UserHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = UserHomeCubit.get(context);
        print("controller: ${cubit.sourceController!.text}");
        return BaseLayoutView(
          header: const UserHomeHeader(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  S.of(context).whereYouWantToGo,
                  style: Styles.textStyle20Bold(context),
                ),
                6.ph,
                CaptionsWidget(),
                20.ph,
                SelectLocation(),
                20.ph,
                const SelectVehicleSection(),
                20.ph,
                CustomTextField(hint: S.of(context).enterOfferRate),
                20.ph,
                CustomDropDown(
                  items: [S.of(context).cash, S.of(context).wallet],
                  onChange: (method) {
                    // handle method change
                  },
                  hint: S.of(context).selectPaymentMethod,
                ),
                20.ph,
                CustomButton(
                  text: S.of(context).bookRide,
                  onTap: () {
                    // Trigger booking logic
                  },
                ),
                20.ph,
              ],
            ),
          ),
        );
      },
    );
  }
}
