import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

Future<void> requestSMSPermission() async {
  var status = await Permission.sms.status;
  if (status.isDenied) {
    if (await Permission.sms.request().isGranted) {
      log("grented");
    } else {
      log("denied");
    }
  } else if (status.isPermanentlyDenied) {
    await openAppSettings();
  } else {
    log("alredy grented");
  }
}
