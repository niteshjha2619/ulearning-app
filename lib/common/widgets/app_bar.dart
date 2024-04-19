import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import '../utils/app_colors.dart';

AppBar buildAppBar({String title = ""}) {
  return AppBar(
    // backgroundColor: Colors.white,
      title: Center(
          child: text16Normal(text: title, color: AppColors.primaryText)),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: AppColors.primaryFourElementText.withOpacity(0.3),
          height: 1,
        ),
      ));
}