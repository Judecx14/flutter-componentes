import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
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
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _cardTipo1(),
          SizedBox(
            height: 30,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30,
          ),
          _containerPersonalizado(),
          SizedBox(
            height: 30,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30,
          ),
          _containerPersonalizado(),
          SizedBox(
            height: 30,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30,
          ),
          _containerPersonalizado(),
          SizedBox(
            height: 30,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30,
          ),
          _containerPersonalizado(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo,
              color: Colors.blue,
            ),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text(
                'Es el subtitulo de la card que estoy aprendiedo con el curso que me compre del compi la neta estoy emocionando'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Ok'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //FORMA CORRECTA DE CARD CON IMAGE Redonda

  Widget _cardTipo2() {
    return Card(
      //Aqui es Card()
      clipBehavior:
          Clip.antiAlias, //En el curso no funciona por la version pero hoy SI
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/e/e3/Che_ne_saj.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 350,
            fit: BoxFit.cover,
          ),
          //Image(
          //  image: NetworkImage(
          //      'https://upload.wikimedia.org/wikipedia/commons/e/e3/Che_ne_saj.jpg'),
          //),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('No tengo idea de que poner'),
          ),
        ],
      ),
    );
  }

  //FORMA DE CREAR UN CONTAINER PERSONALIZDADO CON IMAGE

  Widget _containerPersonalizado() {
    final cardContainer = Container(
      //Aqui es Card()
      //clipBehavior: Clip.antiAlias,//En el curso no funciona por la version pero hoy SI
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Tessellated_Pavement_Sunrise_Landscape.jpg/1024px-Tessellated_Pavement_Sunrise_Landscape.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 350,
            fit: BoxFit.cover,
          ),
          //Image(
          //  image: NetworkImage(
          //      'https://upload.wikimedia.org/wikipedia/commons/e/e3/Che_ne_saj.jpg'),
          //),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Container Personalizado',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
    //Esto es lo del curso pero clipBehivor SI FUNCIONA!!!!!!!!
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100,
            blurRadius: 20,
            spreadRadius: 2.0,
            offset: Offset(0, 20),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: cardContainer,
      ),
    );
  }
}
