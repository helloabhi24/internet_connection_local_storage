import 'package:get/get.dart';
import 'package:internet_connection_local_storage/controller/hive_controller.dart';
import 'package:internet_connection_local_storage/controller/network_controller.dart';
import 'package:internet_connection_local_storage/controller/progress_indicator_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put<ProgressIndicatorController>(ProgressIndicatorController(),
        permanent: true);
    Get.put<HiveDataBaseController>(HiveDataBaseController(), permanent: true);
  }
}
