import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProveedorControlador extends GetxController
{
  CollectionReference firestore = FirebaseFirestore.instance.collection('Proveedor');

 Future borrarProveedor(String id) async {
    try {
      await firestore.doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}