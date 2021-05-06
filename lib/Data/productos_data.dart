import 'package:cloud_firestore/cloud_firestore.dart';

class ListaProductos 
{
  String? nombre;
  String? precio;
  String? descripcion;
  Timestamp? fechaCreada;
  String? identificador;

  ListaProductos(
    this.nombre,
    this.precio,
    this.descripcion,
    this.fechaCreada,
    this.identificador

  );

  ListaProductos.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot
  )
  {
      identificador = documentSnapshot.id;
      nombre = documentSnapshot.data()!['Nombre'];
      precio = documentSnapshot.data()!['Precio'];
      descripcion = documentSnapshot.data()!['Descripcion'];
      fechaCreada = documentSnapshot.data()!['Fecha'];
  }

}