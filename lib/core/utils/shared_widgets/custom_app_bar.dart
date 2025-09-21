import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/padding_extention.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/core/utils/styles.dart';

import '../../../features/base_layout/presentation/view_models/drawer_cubit/drawer_cubit.dart';
import '../../constants/app_const.dart';
import '../../network/local/cache_helper.dart';
import '../../router/routes.dart';
import 'custom_cached_network_image.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        canPop()
            ? IconButton(
                onPressed: () {
                  navigatePop(context);
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 40.r,
                ))
            : IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.sort,
                  color: Colors.white,
                  size: 40.r,
                )),
        Text(
          title ?? '',
          style: Styles.textStyle20Bold(context).copyWith(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            context.read<DrawerCubit>().changeSelectedDrawerItem(6);
            navigateAndReplacement(context, Routes.profileView);
          },
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            radius: 20.r,
            child: (CacheHelper.getData(key: AppConstant.kUserImage) ?? '') ==
                    ''
                ? Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                    size: 35.r,
                  )
                : ClipOval(
                    child: CustomCachedNetworkImage(
                        imgUrl:
                            CacheHelper.getData(key: AppConstant.kUserImage) ??
                                '',
                        width: 38.r,
                        height: 38.r,
                        errorIconSize: 50.r),
                  ),
          ).paddingSymmetric(
            horizontal: 12.w,
          ),
        ),
      ],
    ).paddingSymmetric(
      horizontal: 4.w,
    );
  }
}
