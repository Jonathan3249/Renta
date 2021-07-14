import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/constants.dart';
import 'package:flutter_application_1/controlador/proveedorController.dart';
import 'package:flutter_application_1/menus/add_proveedor.dart';
import 'package:get/get.dart';

class Proveedor extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProveedorControlador>
    (
      init: ProveedorControlador(),
      builder: (_) => Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          Get.to(AddProveedor());
        },
        child: Icon(Icons.add,color:Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
      centerTitle: true,
      title: Text("Lista de Proveedores"),
      ),
      body: StreamBuilder<QuerySnapshot>
      (
        stream: _.firestore.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
        {
          if (snapshot.hasError) {
          return Text('A ocurrido un error');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        return  ListView(
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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.business, size: 70),
            title: Text(document.data()!['Nombre'], style: TextStyle(color: Colors.white, fontSize: 20)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(document.data()!['Direccion'], style: TextStyle(color: Colors.white, fontSize: 14)),
                Text(document.data()!['Telefono'], style: TextStyle(color: Colors.white, fontSize: 14)),
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
                      await _.borrarProveedor(document.id);
                    }
                    );
                }),
              ],
            ),
          ),
        ],
      ),
    ),
  );

          }).toList(),
        );
        }
      )
      ),
      );
  }
}