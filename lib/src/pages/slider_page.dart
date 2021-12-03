import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 200.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        )),
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      //label: _valorSlider
      //.toString(), //Este va de la manoa con division para mostrar el valor seleccionado
      //divisions: 10,
      min: 10.0,
      max: 400.0,
      value: _valorSlider,
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      width: _valorSlider,
      fit: BoxFit.contain,
      image: NetworkImage(
          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/86d35785-8df4-46fb-bd35-d7fcdd54284a/ddcdks7-91309bf7-d18a-4ba4-a1cf-5c1d3c5158ef.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzg2ZDM1Nzg1LThkZjQtNDZmYi1iZDM1LWQ3ZmNkZDU0Mjg0YVwvZGRjZGtzNy05MTMwOWJmNy1kMThhLTRiYTQtYTFjZi01YzFkM2M1MTU4ZWYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.QFq6RL_ERksCbs76ZQO8gKMsCPH1oDilME1-2WZ3RS4'),
    );
  }

  Widget _crearCheckbox() {
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (valor) {
    //     setState(() {
    //       _bloquearCheck = valor!;
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor!;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }
}
