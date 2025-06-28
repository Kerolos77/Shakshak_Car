import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shakshak/core/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../resources/app_colors.dart';
import '../router/router_helper.dart';

List<Color> cardColors = [
  AppColors.secondaryColor,
  Colors.red,
  Colors.blueGrey,
  Colors.indigoAccent,
  Colors.green,
  Colors.tealAccent,
];

int getRandom(int min, int max) {
  return min + Random().nextInt(max - min);
}

Widget defaultTextField({
  required String lable,
  required IconData prefix,
  bool isEnabled = true,
  Function? validate,
  required context,
  IconData? suffix,
  ImageIcon? imageIcon,
  Function? suffixPressed,
  bool isSecure = false,
  required TextInputType type,
  List<TextInputFormatter> formats = const [],
  required var controller,
  Function? ontap,
  // Function? onChange,
}) =>
    TextFormField(
      enabled: isEnabled,
      inputFormatters: formats,
      // style: Theme.of(context).textTheme.button,
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
            icon: Icon(suffix),
            onPressed: () {
              suffixPressed!();
            }),
      ),
      keyboardType: type,
      obscureText: isSecure,
      validator: (String? s) {
        return validate!(s);
      },
      controller: controller,
      onTap: () {
        ontap!();
      },
      // onChanged: (String s){
      //     onChange!(s);
      // },
    );

Widget buildLineText({
  required String firstWord,
  required String secondWord,
  required Color color,
}) =>
    Row(
      children: [
        Text(
          firstWord,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        Text(
          ' $secondWord',
          style: TextStyle(
              fontSize: 19, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );

AppBar buildAppBar(BuildContext context,
    {String? title, Color color = Colors.white, void Function()? onPressed}) {
  return AppBar(
    backgroundColor: color,
    surfaceTintColor: Colors.transparent,
    title: title != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: Styles.textStyle14Bold,
              ),
            ],
          )
        : null,
    leading: canPop()
        ? IconButton(
            onPressed: onPressed ??
                () {
                  navigatePop(context);
                },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.primaryColor,
              size: 20.r,
            ),
          )
        : null,
  );
}

Future<void> makePhoneCall({required String phoneNumber}) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  if (await canLaunchUrl(Uri.parse(launchUri.toString()))) {
    await launchUrl(Uri.parse(launchUri.toString()));
  } else {
    throw 'Could not launch $launchUri';
  }
}
