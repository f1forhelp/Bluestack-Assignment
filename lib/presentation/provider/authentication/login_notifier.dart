import 'package:bluestack_assignment/presentation/provider/base_notifier.dart';
import 'package:bluestack_assignment/utils/constants/pref_constants.dart';
import 'package:bluestack_assignment/utils/di/app_init.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginNotifier extends BaseNotifier {
  login({String? userName, String? pass}) async {
    print(userName);
    print(pass);
    viewState1 = ViewState.loading;
    List<String> allowedUserName = ["9898989898", "9876543210"];

    BotToast.showLoading();
    await Future.delayed(const Duration(seconds: 1));
    if (!allowedUserName.contains(userName)) {
      BotToast.showText(text: "Incorrect user name or password");
      viewState1 = ViewState.error;
    } else {
      if (pass != "password123") {
        BotToast.showText(text: "Incorrect user name or password");
        viewState1 = ViewState.error;
      } else {
        AppInit.pref.setString(KPref.userId, userName ?? "");
        viewState1 = ViewState.loaded;
      }
    }

    BotToast.closeAllLoading();
  }
}
