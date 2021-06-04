import 'package:flutter/material.dart';
import 'package:qrreader/pages/history_directions_page.dart';
import 'package:qrreader/pages/map_page.dart';
import 'package:qrreader/widgets/navigatorbar_custom.dart';
import 'package:qrreader/widgets/scan_custom.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //elimina la sombra
        title: Text(
          'Historial',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete_forever,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: NavigationBarCustom(),
      floatingActionButton: FloatingActionCustom(),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //Centra el floatingActionButton
    );
  }
}

class _HomePageBody extends StatelessWidget {
  //Arbol de widgets custom
  @override
  Widget build(BuildContext context) {
    final currentIndex = 0;

//Cambiar para mostrar la pagina.
    switch (currentIndex) {
      case 0:
        return MapPageScreen();
      case 1:
        return HistoryDirectionsPage();
      default:
        return MapPageScreen();
    }
  }
}
