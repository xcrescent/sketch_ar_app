import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:get/get.dart';
import 'package:sketch_ar_overlay_app/controllers/app_controller.dart';
import 'package:vector_math/vector_math_64.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final AppController appController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(appController.getImageUrl()),
            ArCoreView(
              onArCoreViewCreated: (ArCoreController controller) {
                String imageUrl = appController.getImageUrl();
                controller.addArCoreNode(
                  ArCoreReferenceNode(
                    name: 'Sketchfab',
                    objectUrl: imageUrl,
                    scale: Vector3(0.2, 0.2, 0.2),
                    position: Vector3.zero(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
