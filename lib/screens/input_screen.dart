import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sketch_ar_overlay_app/controllers/app_controller.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  late TextEditingController controller;
  final AppController appController = Get.put(AppController());
  String url = '';
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      url = controller.text;
      // Add your logic here.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: controller,
              onChanged: (url) {
                appController.setImageUrl(url);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                appController.setImageUrl(url);
                Get.toNamed('/camera');
              },
              child: const Text('Proceed to Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
