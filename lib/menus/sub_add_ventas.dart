import 'package:flutter/material.dart';
import 'package:flutter_application_1/controlador/sub_addVentas_controller.dart';
import 'package:get/get.dart';

class SubAgregarVentas extends StatefulWidget {
  

  @override
  _SubAgregarVentasState createState() => _SubAgregarVentasState();
}

class _SubAgregarVentasState extends State<SubAgregarVentas> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubAddVentasController>
    (
      init: SubAddVentasController(),
      builder: (_) => Scaffold()
    );
  }
}