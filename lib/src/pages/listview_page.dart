import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listNumeros = [];
  int _ultimoNumero = 0;
  bool _isLoading = false;

  @override
  void initState() {
    //Este es como el NgOnInit se ejecuta al inicio del widget
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      //Escucha cuando se hace scroll
      if (_scrollController.position.pixels == //donde esta poscionado
          _scrollController.position.maxScrollExtent) {
        //Maximo de altura del scroll
        //_agregar10();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300?image=$imagen'),
            height: 300,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    Timer(duration, () {
      _listNumeros.clear();
      _ultimoNumero++;
      _agregar10();
    });
    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 0; i < 9; i++) {
      _ultimoNumero++;
      _listNumeros.add(_ultimoNumero);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _agregar10();
    _scrollController.animateTo(
      _scrollController.position.pixels + 100, //Offset que tanto se va mover
      curve: Curves.fastOutSlowIn, // Curve la animacion
      duration: Duration(milliseconds: 250), // Duracion
    );
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container(); // colocamos esto porque siempre hay que regresar un widget
    }
  }
}
