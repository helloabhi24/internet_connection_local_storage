import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:internet_connection_local_storage/dependency_injection.dart';
import 'package:internet_connection_local_storage/view/page_one.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("firstBox");
  await Hive.openBox("flagBox");

  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page1(),
    );
  }
}
