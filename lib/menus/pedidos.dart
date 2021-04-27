
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controlador/pedidosController.dart';
import 'package:get/state_manager.dart';

class Pedidos extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<PedidosController>(
      init: PedidosController(),
      builder: (_) =>Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de Pedidos"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff6bceff),
        onPressed: () {
          
        },
        child: Icon(Icons.add,color:Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.all(Radius.circular(50)),
            ),
            child: ListTile(
              leading: Icon(Icons.event_available),
              title: Text("Randy David Cabrera"),
              trailing: Text("-200",style: TextStyle(color: Colors.red),),
              subtitle: Text("Alquiler de 30 tablas de Ceiba y 25 listones\n 20/02/2021"),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text("Comercializadora Ramirez"),
            trailing: Text("+700",style: TextStyle(color: Colors.green),),
            subtitle: Text("Alquiler de 100 tablas de pino\n 23/02/2021"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text("Taller Los Hermanos"),
            trailing: Text("+593",style: TextStyle(color: Colors.green),),
            subtitle: Text("Alquiler de 80 tablas de pino\n 24/02/2021"),
          ),
            Divider(),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text("Esteban Portillo"),
            trailing: Text("+121",style: TextStyle(color: Colors.green),),
            subtitle: Text("Alquiler de 24 tablas de pino\n 26/02/2021"),
          ),
            Divider(),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text("Carlos Rene Matta"),
            trailing: Text("+247",style: TextStyle(color: Colors.red),),
            subtitle: Text("Alquiler de 44 tablas de pino\n 27/02/2021"),
          ),
            Divider(),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text("Humberto Ramirez"),
            trailing: Text("+365",style: TextStyle(color: Colors.green),),
            subtitle: Text("Alquiler de 67 tablas de pino\n 28/03/2021"),
          ),
        ],
      ),
      ),
    );
  }
}