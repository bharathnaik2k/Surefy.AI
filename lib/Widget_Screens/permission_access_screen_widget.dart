import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:surefy/Widget_Screens/main_screen_widget.dart';
import 'package:surefy/utils/colors/colors.dart';
import 'package:surefy/utils/getx/permission_controller.dart';
import 'package:surefy/utils/permissionscreen_utils.dart';

class PermissionAccessScreenWidget extends StatefulWidget {
  const PermissionAccessScreenWidget({super.key});

  @override
  State<PermissionAccessScreenWidget> createState() =>
      _PermissionAccessScreenWidgetState();
}

class _PermissionAccessScreenWidgetState
    extends State<PermissionAccessScreenWidget> {
  PermissionController permissionController = PermissionController();
  @override
  Scaffold build(BuildContext context) {
    final statusIn = Permission.contacts.status;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(
                    centerImage,
                    scale: 1.5,
                  ),
                  Positioned(
                    right: 35,
                    bottom: 115,
                    child: Image.asset(
                      verifyImage,
                      scale: 1.3,
                    ),
                  ),
                ],
              ),
              const Text(
                headingText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                text,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 45),
              TextButton(
                onPressed: () {
                  permissionController.requestContactsPermission();
                  // requestContactsPermission();
                  print(statusIn);
                  // requestPhonePermission();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const MainScreenWidget();
                    },
                  ));
                },
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.only(right: 45, left: 45)),
                  backgroundColor: MaterialStatePropertyAll(lightBlue),
                ),
                child: const Text(
                  accessButtonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
