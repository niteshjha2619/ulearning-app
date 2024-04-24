import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_shadow.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/utils/constants.dart';
import '../../../../common/widgets/text_widgets.dart';
import '../../../../global.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
          text: Global.storageServices.getString(AppConstants.STORAGE_USER_PROFILE_KEY),
          fontWeight: FontWeight.bold),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
          text: "Hello,",
          color: AppColors.primaryThreeElementText,
          fontWeight: FontWeight.bold),
    );
  }
}
AppBar homeAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(iconPath: ImageRes.menu, width: 18, height: 12),
          GestureDetector(
            child: const AppBoxShadowImage(),
          )
        ],
      ),
    ),
  );
}
class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: const Text16Normal(),
          )
        ],
      ),
    );
  }
  
}