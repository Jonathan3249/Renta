


import 'package:get/state_manager.dart';

class VentasController extends GetxController
{
final cambios = Cambios().obs;
void actualizarDatos(int datoNuevo)
{
  cambios.update((valor) { 
    valor?.cambiosNuevos = datoNuevo;
  });
}

}

class Cambios
{
  int? cambiosNuevos = 0;
}

