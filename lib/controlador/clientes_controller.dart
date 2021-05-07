
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class ClientesController extends GetxController
{

final datos = Datos().obs;
void actualizarDatos(String nuevo)
{
  datos.update((val) { 
    val?.datosNuevos = nuevo;
  });
}
}

class Datos
{
  String? datosNuevos;
}

