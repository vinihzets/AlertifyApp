import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

class FirebaseInitialize {
  static initConfigurations() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();
  }
}
