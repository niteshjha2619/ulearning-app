import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/app_shadow.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';

import '../../common/widgets/text_widgets.dart';

Widget appOnBoardingPage(PageController controller, BuildContext context,
    {String imagePath = "",
    String title = "",
    String subTitle = "",
    index = 0}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.fitWidth,
        ),
        Container(
            margin: const EdgeInsets.only(top: 15), child: text24Normal(text: title)),
        Container(
          margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
          child: text16Normal(text: subTitle),
        ),
        _nextButton(index, controller, context),
        const SizedBox(height: 20,)
        //Image.asset("assets/images/boy.png")
      ],
    ),
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      }
    },
    child: Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 100),
      width: 325,
      height: 50,
      decoration: appBoxShadow(),
      child: Center(
          child: text16Normal(
              text: index < 3 ? "Next" : "Get Started",
              color: AppColors.primaryBackground)),
    ),
  );
}
