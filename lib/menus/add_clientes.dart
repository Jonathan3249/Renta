import 'package:flutter/material.dart';

import 'package:flutter_application_1/Data/Database.dart';
import 'package:flutter_application_1/controlador/addClientes_Controller.dart';
import 'package:get/state_manager.dart';



class AddClientes extends StatelessWidget {
  
  
final TextEditingController nombreAdd = TextEditingController();
  final TextEditingController direccionAdd = TextEditingController();
  final TextEditingController telefonoAdd = TextEditingController();
  final TextEditingController cuentaAdd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddClientesController>
    (
      init:AddClientesController(),
    builder: (_)=>Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Agregar Clientes"),),
      body: Container(
        child: ListView(
          children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
                   decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(12, 12)
                        ),
                        color: Colors.blueGrey,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      controller: _.nombreAdd,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.person,
                            color: Color(0xff6bceff),
                        ),
                          hintText: 'Nombre',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(12, 12)
                        ),
                        color: Colors.blueGrey,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      controller: _.direccionAdd,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.location_on,
                          color: Color(0xff6bceff),
                        ),
                        hintText: 'Direccion',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(12, 12)
                        ),
                        color: Colors.blueGrey,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      controller: _.telefonoAdd,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.phone,
                          color: Color(0xff6bceff),
                        ),
                        hintText: 'Telefono',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(12, 12)
                        ),
                        color: Colors.blueGrey,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      controller: _.cuentaAdd,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.format_list_numbered,
                          color: Color(0xff6bceff),
                        ),
                        hintText: 'No de Cuenta',
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                       DataBase().agregarCliente(_.nombreAdd.text.trim(), _.direccionAdd.text.trim(), _.telefonoAdd.text.trim(), _.cuentaAdd.text.trim());
                       _.vaciarText();
                      },
                      child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff6bceff),
                            Color(0xFF00abff),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50)
                        )
                      ),
                      child: Center(
                        child: Text('Agregar'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    ),
    );
  }
}