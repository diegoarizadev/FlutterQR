import 'package:flutter/material.dart';

class NavigationBarCustom extends StatelessWidget {
  const NavigationBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: 0,
      items: <BottomNavigationBarItem>[
        //Se define el tipo de los items -> BottomNavigationBarItem, por lo minimo se deben enviar 2 opciones.
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
          activeIcon: Icon(
            Icons.map,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.compass_calibration,
          ),
          label: 'Direcciones',
        ),
      ],
      selectedItemColor: Colors.orange,
      selectedLabelStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
