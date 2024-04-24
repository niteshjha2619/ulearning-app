import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ulearning_app/common/services/storage.dart';

import 'firebase_options.dart';

class Global {
  static late StorageServices storageServices;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform
    );
    storageServices = await StorageServices().init();
  }
}