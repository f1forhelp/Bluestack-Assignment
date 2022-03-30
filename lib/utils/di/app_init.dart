import 'package:bluestack_assignment/presentation/provider/dashboard/home_provder.dart';
import 'package:get_it/get_it.dart';

class AppInit {
  static late GetIt getIt;

  static initGetit() {
    getIt = GetIt.I;
    //Factories...
    getIt.registerFactory(() => HomeProvider());

    //Singleton...
  }
}
