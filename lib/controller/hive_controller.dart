import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveDataBaseController extends GetxController {
  final myBox = Hive.box("firstBox");
  final flagBox = Hive.box("flagBox");

  late TextEditingController nameController;

  RxString getData = "".obs;
  RxInt intvalue = 0.obs;
  RxBool isflag = false.obs;

  void writeData() {
    // myBox.put(1, nameController.text);
    // print("these are values");
    // print(intvalue.value);
    // print(nameController.text);
    // myBox.put(intvalue.value, nameController.text);
    myBox.add(nameController.text);

    flagBox.add(1);
    // myBox.add(nameController.text);
    print("data added");
    // SnackBar(content: Text('data added'));
  }

  void readData() {
    // getData.value = _myBox.get(1);
    print(myBox.length);
    print(myBox.get(1));
  }

  void flagcheck() {
    print("value of flag");
    print(flagBox.get(0));

    print("this is value of flag");
    print(isflag.value);
    for (int i = 0; i < flagBox.length; i++) {
      if (flagBox.get(i) == 1) {
        isflag.value = true;
      }
      print(flagBox.get(i));
    }
    print("this is value of flag");
    print(isflag.value);
  }

  void cancelAllFlag() {
    for (int i = 0; i < flagBox.length; i++) {
      print("before");
      print(flagBox.get(i));
      flagBox.put(i, 0);
      print("after");
      print(flagBox.get(i));
    }
  }

  void deleteData() {
    myBox.clear();
    flagBox.clear();
    isflag.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
  }
}
