import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import '../utils/app_shadow.dart';
import 'image_widgets.dart';

Widget appTextField(
    {String text = "",
    String iconName = "",
    String hintText = "Type in your info",
    bool obscureText = false,
    void Function(String value)? func}) {
  return Container(
    padding: const EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
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
              Container(
                height: 50,
                width: 290,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
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
              )
            ],
          ),
        )
      ],
    ),
  );
}
