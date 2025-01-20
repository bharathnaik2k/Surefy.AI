// import 'package:get/get.dart;

import 'dart:developer';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  RxBool contactPermission = false.obs;
  Future<void> requestContactsPermission() async {
    var status = await Permission.contacts.status;
    if (status.isDenied) {
      if (await Permission.contacts.request().isGranted) {
        contactPermission == true.obs;
        log("grented");
      } else {
        log("denied");
      }
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    } else {
      contactPermission = true.obs;
      log("alredy grented");
    }
  }
}
