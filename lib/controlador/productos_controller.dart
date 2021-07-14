import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

class ProductosController extends GetxController
{
CollectionReference firestore = FirebaseFirestore.instance.collection('Productos');

 Future borrarProducto(String id) async {
    try {
      await firestore.doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
