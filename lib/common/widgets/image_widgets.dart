import 'package:flutter/cupertino.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';

Widget appImage(
    {String iconPath = ImageRes.defaultImage,
    double width = 16,
    double height = 16}) {
  return Image.asset(
    iconPath.isEmpty ? ImageRes.defaultImage : iconPath,
    width: width,
    height: height,
  );
}
Widget appImageWithColor(
    {String iconPath = ImageRes.defaultImage,
      double width = 16,
      double height = 16,
      Color color = AppColors.primaryElement
    }) {
  return Image.asset(
    iconPath.isEmpty ? ImageRes.defaultImage : iconPath,
    width: width,
    height: height,
    color: color,
  );
}
