import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/app_controller.dart';
import 'screens/input_screen.dart';
import 'screens/camera_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AR Overlay App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/input',
      getPages: [
        GetPage(name: '/input', page: () => const InputScreen()),
        GetPage(name: '/camera', page: () => const CameraScreen()),
      ],
    );
  }
}
