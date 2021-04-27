import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class Scroll extends GetxController
{
  ScrollController? controller;


  @mustCallSuper

 void iniState(){
 controller = ScrollController();
 super.onInit();
}


}