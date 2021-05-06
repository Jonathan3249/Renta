import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class AgregarProductoController extends GetxController
{
  final TextEditingController nombreAdd = TextEditingController();
  final TextEditingController precio = TextEditingController();
  final TextEditingController descripcion = TextEditingController();
  

    void vaciarText()
    {
      nombreAdd.text = "";
      precio.text = "";
      descripcion.text = "";
      Get.snackbar("Producto Agregado", "Se ha agregado correctamente",
      snackPosition: SnackPosition.BOTTOM
      );
    }
}
