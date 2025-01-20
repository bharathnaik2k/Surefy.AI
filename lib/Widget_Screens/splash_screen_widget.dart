import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:surefy/Widget_Screens/main_screen_widget.dart';
import 'package:surefy/utils/getx/permission_controller.dart';
import 'package:surefy/utils/splashscreen_utils.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  PermissionController permissionController = PermissionController();

  void naviFun(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1800), () async {
      var satuts = await Permission.contacts.status;
      if (satuts.isGranted) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            return const MainScreenWidget();
          },
        ));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .pushReplacementNamed("/PermissionAccessScreenWidget");
      }
    });
  }

  @override
  Scaffold build(BuildContext context) {
    Color centerColor = const Color.fromARGB(255, 172, 229, 255);
    Color cornerColor = Colors.white.withOpacity(0.2);
    naviFun(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.8,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: <Color>[
                  centerColor,
                  cornerColor,
                ],
                center: Alignment.center,
                radius: 0.9,
              ),
            ),
            child: Image.asset(
              centerCompanyLogo,
              scale: 1.35,
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.1,
        child: Image.asset(
          bottomDevicePic,
          scale: 1,
        ),
      ),
    );
  }
}
