import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

class ComprasController extends GetxController
{
  final firestoreInstance = FirebaseFirestore.instance;
  CollectionReference firestore = FirebaseFirestore.instance.collection('Compras');

 Future borrarCompras(String id) async {
    try {
      await firestore.doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  void onPressed() {
  firestoreInstance.collection("Compras").add(
  {
    "Proveedor" : "INAB",
    "Total" : 5850,
    "Nota de Compra" : "Correctamente",
    "Producto" : "Tablas de 2 pies",
    "Cantidad" : 150,
    "Producto1" : "Tablas de 3 pies",
    "Cantidad1" : 125,
  }).then((value){
    print(value.id);
  });
}
}