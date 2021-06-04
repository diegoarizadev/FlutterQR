import 'package:flutter/material.dart';

class NavigationBarCustom extends StatelessWidget {
  const NavigationBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = 0;
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        //Se define el tipo de los items -> BottomNavigationBarItem, por lo minimo se deben enviar 2 opciones.
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.compass_calibration,
          ),
          label: 'Direcciones',
        ),
      ],
    );
  }
}
