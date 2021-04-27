
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/menus/homePage.dart';
import 'package:flutter_application_1/menus/loginPage.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';



class LoginController extends GetxController
{
  static LoginController to = Get.find();
  Rxn<User> firebaseUser = Rxn<User>();
  FirebaseAuth auth = FirebaseAuth.instance;

   @override
  void onReady() async {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);

    super.onReady();
  }

  handleAuthChanged(_firebaseUser) async {
    //get user data from firestore

    if (_firebaseUser == null) {
      print('Send to signin');
      Get.offAll(LoginPages());
    } else {
      Get.offAll(HomePage());
    }
  }

Stream<User?> get user => auth.authStateChanges();

  final TextEditingController correo = TextEditingController();
  final TextEditingController pass = TextEditingController();

  void iniciarsesion() async
  {
    try
      {
        final User user = (await auth.signInWithEmailAndPassword(
              email:correo.text.trim(),
              password: pass.text.trim(),
        )).user!;
          if (!user.emailVerified) {
              await user.sendEmailVerification();
              Get.to(HomePage());
              Get.snackbar("Sesion iniciada", "Bienvenido Jona",
              snackStyle: SnackStyle.FLOATING,
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(seconds: 4));
            }
      }
              catch(e)
              {
                Get.snackbar("No se pudo iniciar sesion", "Intente de nuevo");
              }
  }

  void finalizarSesion() async
  {
    await auth.signOut();
  }

}