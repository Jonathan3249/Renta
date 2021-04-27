import 'package:flutter/material.dart';
import 'package:flutter_application_1/controlador/ventasController.dart';
import 'package:get/get.dart';

class Ventas extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VentasController> 
    (
      init: VentasController(),
      builder: (_) => Scaffold(appBar: AppBar(
        centerTitle: true,
        title: Text("Ventas ")

      ,)
      ,)
    );
  }
}