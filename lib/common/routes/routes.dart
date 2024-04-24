import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routes/app_routes_name.dart';
import 'package:ulearning_app/features/home/view/home.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/features/application/view/application.dart';
import 'package:ulearning_app/features/sign_in/view/sign_in.dart';
import 'package:ulearning_app/features/sign_up/view/sign_up.dart';
import 'package:ulearning_app/features/welcome/view/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: SignIn()),
      RouteEntity(path: AppRoutesNames.SIGN_UP, page: SignUp()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: Application()),
      RouteEntity(path: AppRoutesNames.HOME, page: Home()),
    ];
  }

  static MaterialPageRoute generateRouteSetting(RouteSettings settings) {
    if (kDebugMode) {
      print("My Routes ${settings.name}");
    }
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstTime = Global.storageServices.getDeviceFirstOpen();
        if (result.first.path == AppRoutesNames.WELCOME && deviceFirstTime) {
          var isLoggedIn = Global.storageServices.isLoggedIn();

          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => Application(), settings: settings);
          } else {
            return MaterialPageRoute(
                builder: (_) => SignIn(), settings: settings);
          }
        } else {
          return MaterialPageRoute(
              builder: (_) => result.first.page, settings: settings);
        }
      }
    }
    return MaterialPageRoute(builder: (_) => Welcome(), settings: settings);
  }
}

class RouteEntity {
  String? path;
  Widget page;

  RouteEntity({required this.path, required this.page});
}
