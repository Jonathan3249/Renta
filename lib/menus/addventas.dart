import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/variablesGlobal.dart';
import 'package:flutter_application_1/controlador/addventas_controller.dart';
import 'package:flutter_application_1/controlador/clientes_controller.dart';
import 'package:flutter_application_1/menus/clientes.dart';
import 'package:flutter_application_1/menus/productos.dart';
import 'package:get/get.dart';

ClientesController cliente = Get.put(ClientesController());
class AddVentas extends StatefulWidget {
  

  @override
  _AddVentasState createState() => _AddVentasState();
}
 void  actualizarForm(){

}
class _AddVentasState extends State<AddVentas> {
  final controlador = TextEditingController();
  final controlador2 = TextEditingController();
  final controlador3 = TextEditingController();
  final observaciones = TextEditingController();
  final productos = TextEditingController();
  
  void initState()
  {
    super.initState();
    controlador.addListener(() { controlador.text = nombreCliente; });
    controlador2.addListener(() { controlador2.text = nombreProducto; });
    controlador3.addListener(() { controlador3.text = nombreTotal; });
  }
  void dispose()
  {
    controlador.dispose();
    controlador2.dispose();
    controlador3.dispose();
    super.dispose();
    nombreCliente = "";
    nombreProducto = "";
    nombreTotal = "";
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddVentasController> 
    (
      init: AddVentasController(),
      builder: (_) => Scaffold(appBar: AppBar(
        centerTitle: true,
        title: Text("Ventas ")

    ),
    floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4E798F),
        onPressed: () {
        

        },
        child: Icon(Icons.add,color:Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        
        padding: EdgeInsets.all(20),
        child: Column(
        children: [
       TextFormField(
         controller: controlador,
          cursorColor: Theme.of(context).accentColor,
          maxLength: 20,
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Cliente',
            suffixIcon: Icon(
              Icons.person_add,
            ),
          ),
          onTap: (){
              valor = 1;
              Get.to(Clientes())!.asStream();
          },
        ),
        TextFormField(
          controller: controlador3,
          cursorColor: Theme.of(context).accentColor,
          maxLength: 8,
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Total ',
            suffixIcon: Icon(
              Icons.monetization_on
            ),
          ),
        ),
        TextFormField(
          controller: observaciones,
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
        Divider(),
        Container(
          child: Column(
            children: [
              Center(child: Text("Lista de Productos", 
              style: TextStyle(
                backgroundColor: Colors.teal,
                fontSize: 16
              ),),
              ),
             
            ],
          ),
        ),
        Row(
          children: [
            Flexible(
            fit: FlexFit.loose,
            child:TextFormField(
              controller: controlador2,
          cursorColor: Theme.of(context).accentColor,
          decoration: InputDecoration(
            labelText: 'Producto',
            suffixIcon: Icon(
              Icons.check_circle
            ),
          ),
          onTap: ()
          {
            valor1 = 1;
              Get.to(Productos())!.asStream();
          },
        ),
        ),
        Divider(),
        Flexible(child: TextFormField(
          controller: productos,
          cursorColor: Theme.of(context).accentColor,
          decoration: InputDecoration(
            labelText: 'Cantidad',
            suffixIcon: Icon(
              Icons.add
            ),
          ),
        ),)
          ],),
          Divider(),
          Divider(),
          Divider(),
          Divider(),
        ElevatedButton(
          child: Text("Agregar Venta"),

          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          onPressed: () {
        nombreCliente = "";
        nombreProducto = "";
        nombreTotal ="";
        controlador.text = "";
        controlador2.text = "";
        controlador3.text = "";
        observaciones.text = "";
        productos.text = "";
        
         Get.snackbar("Terminado", "Se ha agregado correctamente");
        
          }),
      ]),
      
      ),
      
      ),
    );
  }
}



