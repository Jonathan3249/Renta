
import 'package:flutter/material.dart';


class Menu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Menu Principal'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff6bceff),
        onPressed: () { 
        },
        child: Icon(Icons.add,color:Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Clientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historial',
          ),
        ],
      ),
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
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text("Comercializadora Ramirez"),
            trailing: Text("+400",style: TextStyle(color: Colors.green),),
            subtitle: Text("Alquiler de 100 tablas de pino\n 23/02/2021"),
          ),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text("Taller Los Hermanos"),
            trailing: Text("+380",style: TextStyle(color: Colors.green),),
            subtitle: Text("Alquiler de 80 tablas de pino\n 24/02/2021"),
          ),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text("Esteban Portillo"),
            trailing: Text("+121",style: TextStyle(color: Colors.red),),
            subtitle: Text("Alquiler de 24 tablas de pino\n 26/02/2021"),
          ),
        ],
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
              ),
            ListTile(leading: Icon(Icons.assignment, color: Colors.lightBlue),
              trailing: Icon(Icons.keyboard_arrow_right, color:Colors.lightBlue),
              title: Text('Lista de Pedidos', style: TextStyle( fontSize: 18),
              ),
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
              )
          ],
        ),

      ),

    );
  }
}