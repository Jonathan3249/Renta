
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'componentes/instanceBinding.dart';
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
      initialBinding: InstanceBinding(),
      debugShowCheckedModeBanner: false,
      home:LoginPages(),
      theme: ThemeData.dark(),

    );
  }
}