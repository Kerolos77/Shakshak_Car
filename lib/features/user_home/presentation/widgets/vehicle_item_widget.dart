import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/extentions/glopal_extentions.dart';
import 'package:shakshak/core/utils/shared_widgets/custom_cached_network_image.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:shakshak/features/user_home/data/models/services_model.dart';

class VehicleItemWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final ServiceData service;

  const VehicleItemWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: CustomCachedNetworkImage(
                  imgUrl: service.image ?? '',
                  width: 60.r,
                  height: 60.r,
                  errorIconSize: 30),
            ),
            6.ph,
            Text(
              service.name ?? '',
              style: Styles.textStyle16(context)
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
      ),
    );
  }
}
