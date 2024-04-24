import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/app_shadow.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appButton(
    {String text = "",
    bool isLogin = true,
    double width = 325,
    double height = 50,
    BuildContext? context,
    void Function()? func}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      height: height,
      width: width,
      decoration: appBoxShadow(
          color: isLogin ? AppColors.primaryElement : Colors.white,
          boxBorder: Border.all(color: AppColors.primaryFourElementText)),
      child: Center(
          child: Text16Normal(
              text: text,
              color: isLogin
                  ? AppColors.primaryBackground
                  : AppColors.primaryText)),
    ),
  );
}
