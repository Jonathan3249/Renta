import 'package:cloud_firestore/cloud_firestore.dart';

class ListaClientes 
{
  String? nombre;
  String? direccion;
  String? telefono;
  String? noCuenta;
  Timestamp? fechaCreada;
  String? identificador;

  ListaClientes(
    {this.nombre,
    this.direccion,
    this.telefono,
    this.noCuenta,
    this.fechaCreada,
    this.identificador
    }

  );

 ListaClientes.fromJson(Map<String, dynamic> map, {String? id})
  { ListaClientes(
     identificador: id,
     nombre : map["Nombre"],
     direccion : map["Direccion"],
     telefono : map["Telefono"],
     fechaCreada : map["Fecha"],
     noCuenta : map["Cuenta"]
  );


 
  
  }
} 