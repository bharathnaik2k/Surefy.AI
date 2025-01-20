import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

bool contactPermission = true;
Future<void> requestContactsPermission() async {
  var status = await Permission.contacts.status;
  if (status.isDenied) {
    if (await Permission.contacts.request().isGranted) {
      log("grented");
    } else {
      log("denied");
    }
  } else if (status.isPermanentlyDenied) {
    await openAppSettings();
  } else {
    contactPermission = true;
    log("alredy grented");
  }
}
