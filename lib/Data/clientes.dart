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
    this.nombre,
    this.direccion,
    this.telefono,
    this.noCuenta,
    this.fechaCreada,
    this.identificador

  );

  ListaClientes.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot
  )
  {
      identificador = documentSnapshot.id;
      nombre = documentSnapshot.data()!['Nombre'];
      direccion = documentSnapshot.data()!['Direccion'];
      telefono = documentSnapshot.data()!['Telefono'];
      noCuenta = documentSnapshot.data()!['Cuenta'];
      fechaCreada = documentSnapshot.data()!['Fecha'];
  }



}  