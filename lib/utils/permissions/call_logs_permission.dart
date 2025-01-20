import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';
bool callLogsPermission = false;
Future<void> requestPhonePermission() async {
  var status = await Permission.phone.status;
  if (status.isDenied) {
    if (await Permission.phone.request().isGranted) {
      log("grented");
    } else {
      log("denied");
    }
  } else if (status.isPermanentlyDenied) {
    await openAppSettings();
  } else {
    
    callLogsPermission = true;
    log("alredy grented");
  }
}
