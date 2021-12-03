import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          onPressed: (() => _mostrarAlert(context)),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(20),
            // ),
            shape: StadiumBorder(), //Es lo mismo para redondear
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Alerta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo(
                size: 100,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
