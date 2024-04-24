import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import '../utils/app_shadow.dart';
import 'image_widgets.dart';

Widget appTextField(
    {TextEditingController? controller,
    String text = "",
    String iconName = "",
    String hintText = "Type in your info",
    bool obscureText = false,
    void Function(String value)? func}) {
  return Container(
    padding: const EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: text),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: 330,
          height: 50,
          decoration: appBoxShadowTextField(),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 17),
                child: appImage(iconPath: iconName),
              ),
              appTextFieldOnly(
                  controller: controller,
                  hintText: hintText,
                  func: func,
                  obscureText: obscureText)
            ],
          ),
        )
      ],
    ),
  );
}

Widget appTextFieldOnly({
  TextEditingController? controller,
  String hintText = "Type in your info",
  double width = 280.0,
  double height = 50.0,
  void Function(String value)? func,
  bool obscureText = false,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 7, left: 10),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent))),
      onChanged: (value) => func!(value),
      maxLines: 1,
      autocorrect: false,
      obscureText: obscureText,
    ),
  );
}
