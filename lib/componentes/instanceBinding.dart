import 'package:flutter_application_1/controlador/login_controller.dart';
import 'package:get/get.dart';

class LoginInstanceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}