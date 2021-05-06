import 'package:cloud_firestore/cloud_firestore.dart';


import 'clientes.dart';


class DataBase
{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   Future<void> agregarProducto(String nombre, String precio, String descripcion) async 
  {
    try
    {
      await _firestore 
        .collection('Productos')
        .add({
          'Nombre': nombre,
          'Precio': precio,
          'Descripcion': descripcion,
          'Fecha': Timestamp.now()

        });
    }
    catch(e)
    {
      print(e);
      rethrow;
    }
  }

  Future<void> agregarCliente(String nombre, String direccion, String telefono, String noCuenta) async 
  {
    try
    {
      await _firestore 
        .collection('Clientes')
        .add({
          'Nombre': nombre,
          'Direccion': direccion,
          'Telefono': telefono,
          'Cuenta': noCuenta,
          'Fecha': Timestamp.now(),

        });
    }
    catch(e)
    {
      print(e);
      rethrow;
    }
  }

  Future<void> borrar(ListaClientes lista) async
  {
    try
    {
      await _firestore
      .collection('Clientes')
      .doc(lista.identificador)
      .delete();
    }
    catch(e)
    {
      print(e);
      rethrow;
    }
  }

  Stream<List<ListaClientes>> clientesStream()
  {
    return _firestore
    .collection('Clientes')
    .orderBy('Fecha', descending: true)
    .snapshots()
    .map((QuerySnapshot query)
    {
      List<ListaClientes> retVal = [];
      query.docs.forEach((element) {
        retVal.add(ListaClientes.fromDocumentSnapshot(element));
      });
      return retVal;
    });

  }
}