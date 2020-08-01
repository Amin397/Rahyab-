import 'file:///I:/test_proj/baderan/lib/other/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:load/load.dart';
import 'package:overlay_support/overlay_support.dart';
import 'other/const.dart';
import 'screens/login_screen.dart';
import 'screens/mainScreen.dart';
import 'screens/register/sign_in_screen.dart';
import 'screens/splash.dart';

void main(){
  final systemTheme = SystemUiOverlayStyle.light.copyWith(
    systemNavigationBarColor: Color(0xff290d66),
    systemNavigationBarIconBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(systemTheme);
  runApp(
      LoadingProvider(
        loadingWidgetBuilder: (ctx, data) {
          return Loading();
        },
        child: OverlaySupport(
            child: HomePage()
        ),
      )
  );
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'IRANSans'
      ),
      routes: <String , WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
        SIGN_IN: (BuildContext context) => SignInPage(),
        LOGIN:(BuildContext context) => LoginPage(),
        DASHBOARD:(BuildContext context) => MyHomePage()
      },
      initialRoute: SPLASH_SCREEN,
    );
  }
}

