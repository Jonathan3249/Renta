import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/componentes/constants.dart';
import 'package:flutter_application_1/controlador/add_compras_controller.dart';
import 'package:flutter_application_1/controlador/compras_controller.dart';
import 'package:get/get.dart';

class Compras extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  return GetBuilder<ComprasController>
    (
      init: ComprasController(),
      builder: (_) => Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          Get.to(AddCompras());
        },
        child: Icon(Icons.add,color:Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
      centerTitle: true,
      title: Text("Lista de Compras"),
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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.ballot, size: 50),
            title: Text(document.data()!['Proveedor'], style: TextStyle(color: Colors.white, fontSize: 20)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text( "Total:" + document.data()!['Total'], style: TextStyle(color: Colors.white, fontSize: 14)),
                Divider(),
                Text( "Observacion: " + document.data()!['Nota de Compra'], style: TextStyle(color: Colors.white, fontSize: 14)),
                Divider(),
                Center(child: Text("Pedidos")),
                Divider(),

                Row(
                  children: [
                    Expanded(child: Text(document.data()!['Producto1'], style: TextStyle(color: Colors.white, fontSize: 14))),
                    Text(document.data()!['Cantidad1'], style: TextStyle(color: Colors.white, fontSize: 14)),
                  ],
                ),
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
                      await _.borrarCompras(document.id);
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