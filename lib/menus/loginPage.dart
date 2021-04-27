import 'package:flutter/material.dart';
import 'package:flutter_application_1/controlador/login_controller.dart';

import 'package:get/state_manager.dart';


class LoginPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) => Scaffold(
        body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4.8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF6CB6DB),
                    Color(0xFF122027),
                   // Color(0xff6bceff),
                   // Color(0xff6bceff)
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(65)
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),

                  Align(
                    alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 32,
                          right: 32
                        ),
                        child: Text('Empresa Los Pinos',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height/2.5,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 80),
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
                        Radius.circular(50)
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
                      controller: _.correo,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.person,
                            color: Color(0xff6bceff),
                        ),
                          hintText: 'Usuario',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(50)
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
                      controller: _.pass,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.vpn_key,
                          color: Color(0xff6bceff),
                        ),
                        hintText: 'Contraseña',
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16, right: 32
                      ),
                      child: Text('Olvidaste tu contraseña?',
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                  Spacer(),

                  InkWell(
                      onTap: (){
                        _.iniciarsesion();
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
                        child: Text('Iniciar sesión '.toUpperCase(),
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
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                  child: Row(children: [
                  Text("¿No tienes una cuenta?   "),
                  Text("Registrarte",style: TextStyle(color: Color(0xff6bceff)),),
                  ],),
                  ),
                  
                ], 
              ),
              onTap: (){
              },
            ),
          ],
        ),
      ),
    ),
    );
  }
}