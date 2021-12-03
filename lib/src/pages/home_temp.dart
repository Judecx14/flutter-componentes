import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        //children: _crearItems(),
        children: _crearItemsCorto(),
      ),
    );
  }

  List<Widget> _crearItems() {
    // ignore: deprecated_member_use, unnecessary_new
    List<Widget> lista = <Widget>[];

    for (String opt in opciones) {
      final tempWidget = ListTile(title: Text(opt));
      lista
        ..add(tempWidget)
        ..add(Divider()); // los dos puntos hacen referencia al objeto original
      //lista.add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorto() {
    // var widgets = opciones.map((item) {
    //   return ListTile(
    //     title: Text(item + '!'),
    //   );
    // }).toList();

    // return widgets;

    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text(item + ' !!!'),
            subtitle: Text('Cualquier cosa'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
