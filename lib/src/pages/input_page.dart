import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';
  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];
  TextEditingController _inputFieldDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        title: Text('Inputs de Texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Escribe tu primer nombre',
        suffixIcon: Icon(Icons.edit),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es: $_nombre'),
      subtitle: Text('El email es: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) {
        setState(() => _email = valor);
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.password),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() => _email = valor);
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false, //Desactivar copiado
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.date_range),
        icon: Icon(Icons.dashboard_outlined),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(
            new FocusNode()); //Quita el foco, osea no se pone de color y no aparece teclado
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
      locale: Locale('es', 'ES'),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    for (var poder in _poderes) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    }

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt.toString();
              });
            },
          ),
        )
      ],
    );
  }
}
