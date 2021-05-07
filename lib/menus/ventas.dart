

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controlador/clientes_controller.dart';

import 'package:flutter_application_1/controlador/ventasController.dart';
import 'package:get/get.dart';


import 'clientes.dart';

ClientesController cliente = Get.put(ClientesController());


class Ventas extends StatefulWidget {


  @override
  _VentasState createState() => _VentasState();
}
class _VentasState extends State<Ventas> {
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VentasController> 
    (
      init: VentasController(),
      builder: (_) => Scaffold(appBar: AppBar(
        centerTitle: true,
        title: Text("Ventas ")

    ),
    
      body: Obx(
        () => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
       TextFormField(
         key: Key(cliente.datos.value.datosNuevos.toString()),
         initialValue:cliente.datos.value.datosNuevos ,
          cursorColor: Theme.of(context).accentColor,
          maxLength: 20,
          decoration: InputDecoration(
            labelText: 'Cliente',
            suffixIcon: Icon(
              Icons.check_circle,
            ),
          ),
          onTap: (){
            _.actualizarDatos(1);
            Get.to(Clientes());
            
          },
        ),
        TextFormField(
          cursorColor: Theme.of(context).accentColor,
          maxLength: 20,
          decoration: InputDecoration(
            labelText: 'Precio del Producto',
            helperText: 'Coloque el precio de la tabla ',
            suffixIcon: Icon(
              Icons.check_circle
            ),
          ),
        ),
        TextFormField(
          cursorColor: Theme.of(context).accentColor,
          maxLength: 100,
          decoration: InputDecoration(
            labelText: 'Observaciones del Producto',
            helperText: 'Agregar una observacion (Opcional)',
            suffixIcon: Icon(
              Icons.check_circle
            ),
          ),
        ),
        ElevatedButton(
          child: Text("Agregar Venta"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          onPressed: () {
          })
      ]),
      ),
      ),
      )
    );
  }
}