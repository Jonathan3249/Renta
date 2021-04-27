import 'package:get/get.dart';

class NavController extends GetxController
{
  final _seleccionarIndex = 0.obs;

  get seleccionarIndex => this._seleccionarIndex.value;
  set seleccionarIndex(index) => this._seleccionarIndex.value = index;

  
}