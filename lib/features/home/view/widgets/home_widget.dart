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
          text: Global.storageServices
              .getString(AppConstants.STORAGE_USER_PROFILE_KEY),
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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text16Normal(
                text: "Choice Your Course",
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: const Text10Normal(
                  text: "See All",
                  color: AppColors.primaryThreeElementText,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 5.0, top: 5.0),
                decoration:
                    appBoxShadow(color: AppColors.primaryElement, radius: 7.0),
                child: const Text11Normal(
                  text: "All",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30.0),
                child: const Text11Normal(
                  text: "Popular",
                  color: AppColors.primaryThreeElementText,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30.0),
                child: const Text11Normal(
                  text: "New List",
                  color: AppColors.primaryThreeElementText,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            crossAxisSpacing: 40,
            mainAxisSpacing: 40
          ),
          itemCount: 6,
          itemBuilder: (_, int index) {
            return appImage();
          }),
    );
  }
}
