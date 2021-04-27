import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controlador/NavController.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
            return Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text(document.data()!['Nombre'][0]),

                ),
              title: Text(document.data()!['Nombre']),
              subtitle: Text(document.data()!['Direccion']),
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
