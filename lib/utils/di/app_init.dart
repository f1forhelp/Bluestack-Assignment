import 'package:bluestack_assignment/presentation/provider/dashboard/home_provder.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/provider/authentication/login_notifier.dart';

class AppInit {
  static late GetIt getIt;
  static late SharedPreferences pref;
  static initGetit() {
    getIt = GetIt.I;
    //Factories...
    getIt.registerFactory(() => HomeProvider());
    getIt.registerFactory(() => LoginNotifier());

    //Singleton...
  }

  static initPref() async {
    pref = await SharedPreferences.getInstance();
  }
}
