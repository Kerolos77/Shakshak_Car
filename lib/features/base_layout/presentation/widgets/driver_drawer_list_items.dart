import 'package:flutter/material.dart';
import 'package:shakshak/core/constants/app_const.dart';
import 'package:shakshak/core/network/local/cache_helper.dart';
import 'package:shakshak/features/base_layout/presentation/view_models/drawer_cubit/drawer_cubit.dart';
import 'package:shakshak/generated/l10n.dart';

import '../../../../core/router/router_helper.dart';
import '../../../../core/router/routes.dart';
import '../../../authentication/presentation/widgets/logout_dialog.dart';
import 'custom_drawer_item.dart';

class DriverDrawerListItems extends StatelessWidget {
  const DriverDrawerListItems({
    super.key,
    required this.selectedIndex,
    required this.cubit,
  });

  final int selectedIndex;
  final DrawerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDrawerItem(
          title: S.of(context).city,
          icon: Icons.directions_car,
          isSelected: selectedIndex == 0,
          onTap: () {
            cubit.changeSelectedDrawerItem(0);
            navigateAndReplacement(context, Routes.driverHomeView);
          },
        ),
        CustomDrawerItem(
          title: S.of(context).outstation,
          icon: Icons.directions_bus,
          isSelected: selectedIndex == 1,
          onTap: () {
            cubit.changeSelectedDrawerItem(1);

            navigateAndReplacement(context, Routes.driverOutstationView);
          },
        ),
        CustomDrawerItem(
          title: S.of(context).onlineRegistration,
          icon: Icons.directions_bus,
          isSelected: selectedIndex == 2,
          onTap: () {
            cubit.changeSelectedDrawerItem(2);

            navigateAndReplacement(
                context, Routes.driverOnlineRegistrationView);
          },
        ),
        CustomDrawerItem(
          title: S.of(context).vehicleInformation,
          icon: Icons.directions_bus,
          isSelected: selectedIndex == 3,
          onTap: () {
            cubit.changeSelectedDrawerItem(3);

            navigateAndReplacement(context, Routes.vehicleInformationView);
          },
        ),
        CustomDrawerItem(
          title: S.of(context).myWallet,
          icon: Icons.wallet,
          isSelected: selectedIndex == 4,
          onTap: () {
            cubit.changeSelectedDrawerItem(4);
            navigateAndReplacement(context, Routes.walletView);
          },
        ),
        CustomDrawerItem(
          title: S.of(context).settings,
          icon: Icons.settings,
          isSelected: selectedIndex == 5,
          onTap: () {
            cubit.changeSelectedDrawerItem(5);
            navigateAndReplacement(context, Routes.settingsView);
          },
        ),
        CustomDrawerItem(
          title: S.of(context).profile,
          icon: Icons.person,
          isSelected: selectedIndex == 6,
          onTap: () {
            cubit.changeSelectedDrawerItem(6);
            navigateAndReplacement(context, Routes.profileView);
          },
        ),
        CustomDrawerItem(
          title: S.of(context).faqs,
          icon: Icons.quiz_outlined,
          isSelected: selectedIndex == 7,
          onTap: () {
            cubit.changeSelectedDrawerItem(7);
            navigateAndReplacement(context, Routes.faqView);
          },
        ),
        CacheHelper.getData(key: AppConstant.kToken) != null
            ? CustomDrawerItem(
                title: S.of(context).logout,
                icon: Icons.logout,
                isSelected: false,
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => LogoutDialog(),
                  );
                },
              )
            : CustomDrawerItem(
                title: S.of(context).login,
                icon: Icons.login,
                isSelected: false,
                onTap: () {
                  navigateAndFinish(context, Routes.loginView);
                },
              ),
      ],
    );
  }
}
