import 'package:get/get.dart';

class AppController extends GetxController {
  RxString imageUrl = ''.obs;

  void setImageUrl(String url) {
    imageUrl.value = url;
  }

  String getImageUrl() {
    return imageUrl.value;
  }
  
}
