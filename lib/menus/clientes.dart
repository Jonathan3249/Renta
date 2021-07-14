import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/variablesGlobal.dart';


import 'package:flutter_application_1/componentes/constants.dart';
import 'package:flutter_application_1/controlador/NavController.dart';
import 'package:flutter_application_1/controlador/addventas_controller.dart';
import 'package:flutter_application_1/controlador/clientes_controller.dart';
import 'package:flutter_application_1/controlador/scrollController.dart';
import 'package:flutter_application_1/menus/add_clientes.dart';

import 'package:get/get.dart';





final List<Widget> contenido =
  [
    Text("Inicio"),
    Text("Historial"),
  ];
final NavController nav = Get.put(NavController());
final AddVentasController ventas =Get.put(AddVentasController());
final Scroll scr = Scroll();

class Clientes extends StatefulWidget {


  @override
  _ClientesState createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  

  CollectionReference _firestore = FirebaseFirestore.instance.collection('Clientes');
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientesController>(
      init: ClientesController(),
      builder: (_) => Scaffold(
        
        appBar: AppBar(
          centerTitle: true,
          title: Text("Clientes"),
        ),
          floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4E798F),
        onPressed: () {
        Get.to(AddClientes());
        },
        child: Icon(Icons.add,color:Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: StreamBuilder<QuerySnapshot>(
      stream: _firestore.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('A ocurrido un error');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
            return Container(
    width: 400,
    padding: new EdgeInsets.all(3.0),

    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19.0),
      ),
      color: Colors.transparent,
      elevation: 3,
      child: Column(
        
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(

                  backgroundColor: Colors.amber,
                  child: Text(document.data()!['Nombre'][0]),
                  radius: 17,
                ),
            title: Text(document.data()!['Nombre'], style: TextStyle(color: Colors.white, fontSize: 17)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text( document.data()!['Telefono'], style: TextStyle(color: Colors.white, fontSize: 14)),
                Text( document.data()!['Direccion'], style: TextStyle(color: Colors.white, fontSize: 14)),
              ],),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                icon: Icon(Icons.delete, color: Colors.red), 
                onPressed: (){
                  mydialog(
                    context,
                    title: "Esta seguro de eliminar?",
                    content: "Borrar " + document.data()!['Nombre'],
                    ok: ()async
                    {
                      Get.back();
                      await _.deletevehicule(document.id);
                    }
                    );
                }),
              ],
            ),
            onTap: (){
            if(valor == 1)
            {
              nombreCliente = document.data()!['Nombre'];
              
              Get.back();
              setState(() {
                valor = 0;
              });
              
            }
            else
            {
              
            }

            },
          ),
        ],
      ),
    ),
  );
          }).toList(),
        );

      },
  ),
        ),
      );
  }
}


