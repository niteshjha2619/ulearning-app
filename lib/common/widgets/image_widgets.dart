import 'package:flutter/cupertino.dart';

Widget appImage(
    {String iconPath = "assets/icons/user.png",
    double width = 16,
    double height = 16}) {
  return Image.asset(
    iconPath.isEmpty ? "assets/icons/user.png" : iconPath,
    width: width,
    height: height,
  );
}
