import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/variablesGlobal.dart';
import 'package:flutter_application_1/componentes/constants.dart';
import 'package:flutter_application_1/controlador/productos_controller.dart';
import 'package:flutter_application_1/menus/add_productos.dart';
import 'package:get/get.dart';

class Productos extends StatefulWidget {
  @override
  _ProductosState createState() => _ProductosState();
}

class _ProductosState extends State<Productos> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductosController>
    (
      init: ProductosController(),
      builder: (_) => Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: () {
          Get.to(AddProductos());
        },
        child: Icon(Icons.add,color:Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
      centerTitle: true,
      title: Text("Lista de Productos"),
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
            leading: Icon(Icons.ballot, size: 50),
            title: Text(document.data()!['Nombre'], style: TextStyle(color: Colors.white, fontSize: 20)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text( "Precio:" + document.data()!['Precio'], style: TextStyle(color: Colors.white, fontSize: 14)),
              ],),
              onTap: ()
              {
                if(valor1 == 1)
                {
              nombreProducto = document.data()!['Nombre'];
              
              Get.back();
              setState(() {
                valor1 = 0;
                nombreTotal= "500";
              });
              
            }
            else
            {
              
            }
              },

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
                      await _.borrarProducto(document.id);
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