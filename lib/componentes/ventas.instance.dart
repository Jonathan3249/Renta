import 'package:flutter_application_1/controlador/ventasController.dart';
import 'package:get/get.dart';

class VentasInstanceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<VentasController>(() => VentasController());
  }
}