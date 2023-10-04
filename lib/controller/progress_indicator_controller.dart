import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_local_storage/controller/hive_controller.dart';

class ProgressIndicatorController extends GetxController {
  RxBool loading = false.obs;
  RxDouble progressValue = 0.0.obs;

  HiveDataBaseController hiveDataBaseController = Get.find();

  void updateProgress() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      progressValue.value += 0.1;
      // we "finish" downloading here
      if (progressValue.value.toStringAsFixed(1) == '1.0') {
        loading.value = false;
        progressValue.value = 0.0;
        t.cancel();
        hiveDataBaseController.isflag.value = false;
        return;
      }
    });
  }
}
