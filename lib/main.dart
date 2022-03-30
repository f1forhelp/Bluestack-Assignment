import 'package:bluestack_assignment/presentation/pages/authentication/login_screen.dart';
import 'package:bluestack_assignment/presentation/pages/dashboard/home_page.dart';
import 'package:bluestack_assignment/utils/di/app_init.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  AppInit.initGetit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: () => MaterialApp(
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        home: const LoginPage(),
      ),
    );
  }
}
