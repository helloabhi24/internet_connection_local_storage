import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/hive_controller.dart';
import '../controller/network_controller.dart';
import '../controller/progress_indicator_controller.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    NetworkController _networkController = Get.find();
    ProgressIndicatorController progressIndicatorController = Get.find();
    HiveDataBaseController hiveDataBaseController = Get.find();
    return Obx(
      () => Scaffold(
          floatingActionButton: hiveDataBaseController.isflag.value
              ? FloatingActionButton(
                  onPressed: () {
                    print("thisss");
                    print(progressIndicatorController.loading.value);
                    print(hiveDataBaseController.isflag.value);
                    hiveDataBaseController.cancelAllFlag();

                    progressIndicatorController.loading.value =
                        !progressIndicatorController.loading.value;
                    progressIndicatorController.updateProgress();
                  },
                  tooltip: 'Download',
                  child: Icon(Icons.cloud_download),
                )
              : SizedBox.shrink(),
          appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent[700],
            title: Text("Page two"),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),

                progressIndicatorController.loading.value
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          LinearProgressIndicator(
                            backgroundColor: Colors.cyanAccent,
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.red),
                            value:
                                progressIndicatorController.progressValue.value,
                          ),
                          Text(
                              '${(progressIndicatorController.progressValue.value * 100).round()}%'),
                        ],
                      )
                    : Text("Press button for Sync Data",
                        style: TextStyle(fontSize: 25)),
                Text(
                  " internet is ${_networkController.isInternet.value}",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),

                MaterialButton(
                  color: const Color(0xff1D1E22),
                  onPressed: () {
                    hiveDataBaseController.deleteData();
                  },
                  height: 60,
                  minWidth: 200,
                  child: const Text(
                    "Delete data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 150,
                  width: 50,
                  child: Center(
                    child: ListView.builder(
                        itemCount: hiveDataBaseController.myBox.length,
                        itemBuilder: ((context, index) => Text(
                            "${hiveDataBaseController.myBox.get(index)}"))),
                  ),
                ),
                // Text(
                //   "${hiveDataBaseController.getData.value}",
                //   style: TextStyle(color: Colors.black),
                // ),
              ],
            ),
          )),
    );
  }
}
