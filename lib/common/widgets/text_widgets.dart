import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';

Widget text24Normal(
    {String text = "",
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: color, fontSize: 24, fontWeight: fontWeight),
  );
}

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text16Normal(
      {super.key,
      this.text = "",
      this.color = AppColors.primarySecondaryElementText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:
          TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.normal),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;

  const Text14Normal(
      {super.key,
      this.text = "",
      this.color = AppColors.primaryThreeElementText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style:
          TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.normal),
    );
  }
}

Widget textUnderLine({String text = ""}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: const TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontWeight: FontWeight.normal,
          fontSize: 12),
    ),
  );
}
