import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/pages/history_map_page.dart';
import 'package:qrreader/pages/home_page.dart';
import 'package:qrreader/pages/map_page.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                UiProvider()), //se Ejecutara cuando no hay una instancia ninguna estancia del provider
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ], //El context de la App va a contener las instancias de los provider para utilizar en cualquier parte.
      child: MaterialApp(
        theme: ThemeData(
          //ThemeData.dark(),
          primaryColor: Colors.orange,
          primarySwatch: Colors.orange,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.orange,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(color: Colors.orange),
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
        title: 'Lector de códigos QR',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePageScreen(),
          'Map': (_) => MapPageScreen(),
          'HistoryMap': (_) => HistoryMapPage(),
        },
      ),
    );
  }
}
