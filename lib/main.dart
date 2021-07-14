
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'componentes/ventas.instance.dart';
import 'menus/ventas.dart';
import 'componentes/Clientes_instance.dart';
import 'menus/clientes.dart';
import 'package:get/get.dart';
import 'componentes/instanceBinding.dart';
import 'menus/homePage.dart';
import 'menus/loginPage.dart';




Future<void> main() async
{ WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 runApp(MyApp());
 }

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
getPages: [
      GetPage(
        name: '/home',
        page: () => HomePage(),
      ),
      GetPage(
        name: '/login',
        page: () => LoginPages(),
        binding: LoginInstanceBinding(),
      ),
      GetPage(
        name: '/clientes',
        page: () => Clientes(),
        binding: ClientesInstanceBinding(),
      ),
      GetPage(
        name: '/ventas',
        page: () => Ventas(),
        binding: VentasInstanceBinding(),
      ),
],
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      theme: ThemeData.dark(),

    );
  }
}