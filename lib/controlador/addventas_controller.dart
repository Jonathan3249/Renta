import 'package:get/get.dart';


class AddVentasController extends GetxController
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

class Userr
{
   int? id = 1;

  Userr({
    this.id
  });

}

