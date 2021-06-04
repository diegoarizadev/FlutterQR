import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/ui_provider.dart';

class NavigationBarCustom extends StatelessWidget {
  const NavigationBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (int i) {
        //Detecta la opción seleccionada.
        uiProvider.selectedMenuOpt =
            i; //Pasa el valor seleccionado por el setter de la clase., 1 o 0
      },
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
