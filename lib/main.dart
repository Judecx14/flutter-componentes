import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), // English, no country code
        Locale('es', 'ES'), // Spanish, no country code
      ],
      debugShowCheckedModeBanner: false,
      title: 'Componentes APP',
      //home: HomePage(),
      initialRoute: '/',
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        //Est es en caso de que no exista la ruta
        print('Ruta llamada: ${settings.name}');
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage(),
        );
      },
    );
  }
}
