

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controlador/homepage_controller.dart';
import 'package:flutter_application_1/controlador/login_controller.dart';
import 'package:flutter_application_1/controlador/pedidosController.dart';
import 'package:flutter_application_1/menus/pedidos.dart';
import 'package:flutter_application_1/menus/productos.dart';
import 'package:flutter_application_1/menus/proveedor.dart';
import 'package:flutter_application_1/menus/ventas.dart';

import 'package:get/get.dart';

import 'clientes.dart';
import 'compras.dart';
import 'loginPage.dart';


class HomePage extends StatelessWidget {
  final LoginController salir = LoginController();
  final PedidosController ped = PedidosController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Menu Principal"),
        ),
        drawer: Drawer(
        child: ListView(
          children: <Widget>[
              UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person,size: 50.0,),
              ),
              accountName: Text('Empresa los Pinos'),
              accountEmail: Text('lospinos@gmail.com'),
            ),
            ListTile(leading: Icon(Icons.person_add, color: Colors.lightBlue),
              trailing: Icon(Icons.keyboard_arrow_right,color:Colors.lightBlue),
              title: Text('Clientes', style: TextStyle( fontSize: 18),
            ),
            onTap: (){
              Get.to(Clientes());
            },
            ),
            ListTile(leading: Icon(Icons.shopping_cart, color: Colors.lightBlue),
              trailing: Icon(Icons.keyboard_arrow_right, color:Colors.lightBlue),
              title: Text('Compras', style: TextStyle( fontSize: 18),
            ),
            onTap: (){
              Get.to(Compras());
            },
            ),
              ListTile(leading: Icon(Icons.inventory, color: Colors.lightBlue),
              trailing: Icon(Icons.keyboard_arrow_right, color:Colors.lightBlue),
              title: Text('Productos', style: TextStyle( fontSize: 18),
            ),
            onTap: ()
            {
              Get.to(Productos());
            },
            ),
            ListTile(leading: Icon(Icons.list, color: Colors.lightBlue),
              trailing: Icon(Icons.keyboard_arrow_right, color:Colors.lightBlue),
              title: Text('Ventas', style: TextStyle( fontSize: 18),
              ),
              onTap: ()
              {
                Get.to(Ventas());
              },

              ),
            ListTile(leading: Icon(Icons.assignment, color: Colors.lightBlue),
              trailing: Icon(Icons.keyboard_arrow_right, color:Colors.lightBlue),
              title: Text('Lista de Pedidos', style: TextStyle( fontSize: 18),
              ),
              onTap: (){
                Get.to(Pedidos());
              }
              ),
              ListTile(leading: Icon(Icons.business_rounded, color: Colors.lightBlue),
              trailing: Icon(Icons.keyboard_arrow_right, color:Colors.lightBlue),
              title: Text('Provedores', style: TextStyle( fontSize: 18),
              ),
              onTap: (){
                Get.to(Proveedor());
              }
              ),
            Divider(height: 189,),
            ListTile(leading: Icon(Icons.exit_to_app, color: Colors.lightBlue),
              trailing: Icon(Icons.power_settings_new, color:Colors.lightBlue),
              title: Text('Salir', style: TextStyle( fontSize: 18),
              ),
              onTap: (){
                salir.finalizarSesion();
                Get.offAll(LoginPages());
              },
              )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
           Row(
             children: [
                Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 3,
              color: Colors.teal.shade400,
              child: InkWell(
                onTap: (){
                  Get.to(Clientes());
                },
                splashColor: Colors.blue.withAlpha(30),
                  child: const SizedBox(
                    width: 183,
                    height: 100,
                    child: Center(
                      child: Text('Clientes', style: TextStyle(fontSize: 24, color: Colors.black),)
                      ,),
          ),

              ),
            ),
            Divider(),
            Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 3,
              color: Colors.deepOrangeAccent.shade200,
              child: InkWell(
                onTap: (){
                  Get.to(Proveedor());
                },
                splashColor: Colors.deepOrangeAccent.withAlpha(90),
                  child: const SizedBox(
                    width: 183,
                    height: 100,
                    child: Center(
                      child: Text('Proveedores', style: TextStyle(fontSize: 24, color: Colors.black ),)
                      ,),
          ),

              ),
            ),
             ],
           ),
            Divider(),
            Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 3,
              color: Colors.teal.shade400,
              child: InkWell(
                onTap: (){
                  Get.to(Productos());
                },
                splashColor: Colors.blue.withAlpha(30),
                  child: const SizedBox(
                    width: 400,
                    height: 100,
                    child: Center(
                      child: Text('Productos', style: TextStyle(fontSize: 24, color: Colors.black),)
                      ,),
          ),

              ),
            ),
            Divider(),
            Row(
             children: [
                Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 3,
              color: Colors.teal.shade400,
              child: InkWell(
                onTap: (){
                  Get.to(Pedidos());
                },
                splashColor: Colors.blue.withAlpha(30),
                  child: const SizedBox(
                    width: 183,
                    height: 100,
                    child: Center(
                      child: Text('Lista de Pedidos', style: TextStyle(fontSize: 24, color: Colors.black),)
                      ,),
          ),

              ),
            ),
            Divider(),
            Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 3,
              color: Colors.deepOrangeAccent.shade200,
              child: InkWell(
                onTap: (){
                  Get.to(Compras());
                },
                splashColor: Colors.deepOrangeAccent.withAlpha(90),
                  child: const SizedBox(
                    width: 183,
                    height: 100,
                    child: Center(
                      child: Text('Compras',  style: TextStyle(fontSize: 24, color: Colors.black ),)
                      ,),
          ),

              ),
            ),
             ],
           ),
            Divider(),
            Card(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 3,
              color: Colors.deepOrangeAccent.shade200,
              child: InkWell(
                onTap: (){
                  Get.to(Ventas());
                },
                splashColor: Colors.blue.withAlpha(30),
                  child: const SizedBox(
                    width: 400,
                    height: 100,
                    child: Center(
                      child: Text('Ventas', style: TextStyle(fontSize: 24, color: Colors.black),)
                      ,),
          ),

              ),
            )
          ],
        ),)
    ),
    );
  }
}