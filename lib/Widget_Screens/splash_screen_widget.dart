import 'package:flutter/material.dart';
import 'package:surefy/utils/splashscreen_utils.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  void naviFun(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1800), () {
      Navigator.of(context)
          .pushReplacementNamed("/PermissionAccessScreenWidget");
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
