import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class AddProveedorController extends GetxController
{
  final TextEditingController nombreAdd = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController telefono = TextEditingController();
  final TextEditingController correo = TextEditingController();
  

    void vaciarText()
    {
      nombreAdd.text = "";
      direccion.text = "";
      telefono.text = "";
      correo.text = "";
      Get.snackbar("Proveedor", "Se ha agregado correctamente",
      snackPosition: SnackPosition.BOTTOM
      );
    }

}