import 'package:flutter/material.dart';
import 'package:flutter_application_1/controlador/homepage_controller.dart';
import 'package:flutter_application_1/controlador/login_controller.dart';
import 'package:flutter_application_1/controlador/pedidosController.dart';
import 'package:flutter_application_1/menus/pedidos.dart';
import 'package:flutter_application_1/menus/ventas.dart';

import 'package:get/get.dart';

import 'clientes.dart';
import 'loginPage.dart';


class HomePage extends StatelessWidget {
  final LoginController salir = LoginController();
  final PedidosController ped = PedidosController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        body: Center(),
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
            ListTile(leading: Icon(Icons.show_chart, color: Colors.lightBlue),
              trailing: Icon(Icons.keyboard_arrow_right, color:Colors.lightBlue),
              title: Text('Reportes', style: TextStyle( fontSize: 18),
              ),
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
    ),
    );
  }
}