
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class ClientesController extends GetxController
{ 
  final CollectionReference clientesCol =
      FirebaseFirestore.instance.collection("Clientes");


@override 
void onInit() {
    super.onInit();
  }
final datos = Datos().obs;
void actualizarDatos(String nuevo)
{
  datos.update((val) { 
    val?.datosNuevos = nuevo;
  });
}

 Future deletevehicule(String id) async {
    try {
      await clientesCol.doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

}

class Datos
{
  String? datosNuevos;
}

class Usuario
{
  String probar = "";
}
