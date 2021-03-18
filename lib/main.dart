import 'package:boy_kilo_endeksi/pages/gecmis_screen.dart';
import 'package:boy_kilo_endeksi/pages/grafik_screen.dart';
import 'package:boy_kilo_endeksi/pages/panel_screen.dart';
import 'package:boy_kilo_endeksi/pages/yeni_kilo_screen.dart';
import 'package:flutter/material.dart';

import 'pages/home_screen.dart';
import 'pages/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kilo Analiz',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home_screen',
      theme: ThemeData(
        primaryColor: Color(0xFF0176BC),
        accentColor: Colors.cyanAccent,
      ),
      routes: <String, WidgetBuilder>{
        'splash_screen': (BuildContext context) => SplashScreen(),
        'home_screen': (BuildContext context) => HomeScreen(),
        'panel_screen': (BuildContext context) => PanelScreen(),
        'yeni_kilo_screen': (BuildContext context) => YeniKiloScreen(),
        'gecmis_screen': (BuildContext context) => GecmisScreen(),
        'grafik_screen': (BuildContext context) => GrafikScreen(),
      },
    );
  }
}
