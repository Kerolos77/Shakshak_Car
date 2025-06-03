import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';
import '../styles.dart';

class FailureView extends StatelessWidget {
  const FailureView({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie.asset(AppAssets.errorLottiePath),
            Text(
              textAlign: TextAlign.center,
              errorMessage,
              style: Styles.textStyle22Bold
                  .copyWith(color: AppColors.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
