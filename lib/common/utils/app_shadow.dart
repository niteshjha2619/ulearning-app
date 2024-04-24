import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

import 'image_res.dart';

BoxDecoration appBoxShadow(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 1,
    double bR = 2,
    BoxBorder? boxBorder}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: boxBorder,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxShadowWithRadius(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 1,
    double bR = 2,
    BoxBorder? border}) {
  return BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      border: border,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxShadowTextField(
    {Color color = AppColors.primaryBackground,
    double radius = 15,
    Color borderColor = AppColors.primaryFourElementText}) {
  return BoxDecoration(
    color: color,
    border: Border.all(color: borderColor, width: 1.0),
    borderRadius: BorderRadius.circular(radius),
  );
}

class AppBoxShadowImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;

  const AppBoxShadowImage(
      {super.key,
      this.width = 40.0,
      this.height = 40.0,
      this.imagePath = ImageRes.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imagePath), fit: BoxFit.fitHeight),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
