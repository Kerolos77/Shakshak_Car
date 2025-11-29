import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shakshak/core/router/router_helper.dart';
import 'package:shakshak/core/router/routes.dart';
import 'package:shakshak/generated/assets.dart';

import '../../../../core/constants/app_const.dart';
import '../../../../core/network/local/cache_helper.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      if (CacheHelper.getData(key: AppConstant.kOnBoarding) ?? false == true) {
        if (CacheHelper.getData(key: AppConstant.kToken) != null) {
          if (CacheHelper.getData(key: AppConstant.kIsDriver) == 1) {
            navigateAndFinish(context, Routes.driverHomeView);
          } else {
            navigateAndFinish(context, Routes.userHomeView);
          }
        } else {
          navigateAndFinish(
            context,
            Routes.loginView,
          );
        }
      } else {
        navigateAndFinish(
          context,
          Routes.onBoardingView,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          /* Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.linearPrimarySecondaryColor,
              ),
            ),
          ),*/
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Opacity(
                opacity: _animation.value,
                child: Transform.scale(
                  scale: _animation.value,
                  child: Center(
                    child: SvgPicture.asset(Assets.svgLogin),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
