import 'package:flutter_application_1/controlador/clientes_controller.dart';
import 'package:get/get.dart';

class ClientesInstanceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ClientesController>(() => ClientesController());
  }
}