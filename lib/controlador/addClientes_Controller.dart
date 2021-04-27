import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class AddClientesController extends GetxController
{
  final TextEditingController nombreAdd = TextEditingController();
  final TextEditingController direccionAdd = TextEditingController();
  final TextEditingController telefonoAdd = TextEditingController();
  final TextEditingController cuentaAdd = TextEditingController();

 

    void vaciarText()
    {
      nombreAdd.text = "";
      direccionAdd.text = "";
      telefonoAdd.text = "";
      cuentaAdd.text = "";
      Get.snackbar("Cliente Agregado", "Se ha agregado correctamente",
      snackPosition: SnackPosition.BOTTOM
      );
    }


}