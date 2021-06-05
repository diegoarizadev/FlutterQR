import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/pages/history_directions_page.dart';
import 'package:qrreader/pages/map_page.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/providers/ui_provider.dart';
import 'package:qrreader/widgets/navigatorbar_custom.dart';
import 'package:qrreader/widgets/scan_custom.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(
      context, //Busca en el arbol de widget el provider ScanListProvider
    ); //Cuando colocar el Listener en false o true, dentro de un build va en true, o sea no se coloca

    return Scaffold(
      appBar: AppBar(
        elevation: 0, //elimina la sombra
        title: Text(
          'Historial',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              scanListProvider.deleteAll();
              print('Borrar');
            },
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
    //en el context se encuentra el provider.

    //Obtener el Selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider = Provider.of<ScanListProvider>(context,
        listen:
            false); //No se requiere que se redibuje, por lo tanto se envia el parametro listen en false.

    //Cambiar para mostrar la pagina.
    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansForType('geo');
        return MapPageScreen();
      case 1:
        scanListProvider.loadScansForType('http');
        return HistoryDirectionsPage();
      default:
        return MapPageScreen();
    }
  }
}
