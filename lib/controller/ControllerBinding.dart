// ignore: file_names
import 'package:get/get.dart';
import 'package:sav/controller/AuthController.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
