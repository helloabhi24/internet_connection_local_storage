import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_local_storage/controller/hive_controller.dart';
import 'package:internet_connection_local_storage/view/page_two.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    HiveDataBaseController hiveDataBaseController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1E22),
        title: Text("Page one"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 100,
              child: TextField(
                controller: hiveDataBaseController.nameController,
                decoration: InputDecoration(hintText: "Enter name"),
              )),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: const Color(0xff1D1E22),
            onPressed: () {
              debugPrint("hello");
              hiveDataBaseController.intvalue.value += 1;
              hiveDataBaseController.writeData();
              hiveDataBaseController.readData();
              hiveDataBaseController.flagcheck();
              Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: ((context) => const Page2())));
            },
            height: 60,
            minWidth: 200,
            child: const Text(
              "write data",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: const Color(0xff1D1E22),
            onPressed: () {
              hiveDataBaseController.readData();
              print("calling the flag");
              hiveDataBaseController.flagcheck();

              print(hiveDataBaseController.flagBox.length);
              Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: ((context) => const Page2())));
            },
            height: 60,
            minWidth: 200,
            child: const Text(
              "Get data",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )),
    );
  }
}
