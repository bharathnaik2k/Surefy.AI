import 'package:flutter/material.dart';
import 'package:surefy/Widget_Screens/permission_access_screen_widget.dart';
import 'package:surefy/Widget_Screens/splash_screen_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Roboto_Flex"),
      initialRoute: "/SplashScreenWidget",
      routes: {
        "/SplashScreenWidget": (context) => const SplashScreenWidget(),
        "/PermissionAccessScreenWidget": (context) =>
            const PermissionAccessScreenWidget(),
      },
    );
  }
}
