import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/Database.dart';
import 'package:flutter_application_1/controlador/add_proveedor_controller.dart';
import 'package:get/get.dart';

class AddProveedor extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProveedorController>
    (
      init: AddProveedorController(),
      builder: (_) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Agregar Proveedores")
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        TextFormField(
          controller: _.nombreAdd,
          cursorColor: Theme.of(context).accentColor,
          maxLength: 50,
          decoration: InputDecoration(
            labelText: 'Nombre de la empresa',
            suffixIcon: Icon(
              Icons.check_circle,
            ),
          ),
        ),
        TextFormField(
          controller: _.direccion,
          cursorColor: Theme.of(context).accentColor,
          maxLength: 40,
          decoration: InputDecoration(
            labelText: 'Direccion',
            helperText: 'Coloque la direccion ',
            suffixIcon: Icon(
              Icons.check_circle
            ),
          ),
        ),
        TextFormField(
          controller: _.telefono,
          cursorColor: Theme.of(context).accentColor,
          maxLength: 8,
          decoration: InputDecoration(
            labelText: 'Telefono ',
            helperText: 'Agregar el telefono',
            suffixIcon: Icon(
              Icons.check_circle
            ),
          ),
        ),
        TextFormField(
          controller: _.correo,
          cursorColor: Theme.of(context).accentColor,
          maxLength: 25,
          decoration: InputDecoration(
            labelText: 'Correo',
            helperText: 'Agregar el correo',
            suffixIcon: Icon(
              Icons.check_circle
            ),
          ),
        ),
        ElevatedButton(
          child: Text("Agregar Proveedor"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          onPressed: () {
            DataBase().agregarProveedor(_.nombreAdd.text.trim(), _.direccion.text.trim(), _.telefono.text.trim(), _.correo.text.trim());
            _.vaciarText();
          })
      ]),
      ),
      ),
      );
  }
}