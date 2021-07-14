import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/Database.dart';
import 'package:flutter_application_1/controlador/add_producto_controller.dart';
import 'package:get/get.dart';

class AddProductos extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgregarProductoController>
    (
      init: AgregarProductoController(),
      builder: (_) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Agregar Productos")
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        TextFormField(
          controller: _.nombreAdd,
          cursorColor: Theme.of(context).accentColor,
          maxLength: 20,
          decoration: InputDecoration(
            labelText: 'Nombre del Producto',
            suffixIcon: Icon(
              Icons.check_circle,
            ),
          ),
        ),
        TextFormField(
          controller: _.precio,
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
          controller: _.descripcion,
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
          child: Text("Agregar Producto"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          onPressed: () {
            DataBase().agregarProducto(_.nombreAdd.text.trim(), _.precio.text.trim(), _.descripcion.text.trim());
            _.vaciarText();
          })
      ]),
      )
      )
      );
  }
}