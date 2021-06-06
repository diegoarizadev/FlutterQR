import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(
      context, //Busca en el arbol de widget el provider ScanListProvider
    ); //Cuando colocar el Listener en false o true, dentro de un build va en true, o sea no se coloca

    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: Key(scans[i]
            .id
            .toString()), //Esta funcion genera automaticamente un key
        background: Container(
          padding: EdgeInsets.all(20),
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Eliminar',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Icon(
                Icons.delete_forever,
                size: 30,
                color: Colors.white,
              ),
            ],
          ),
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteForId(scans[i].id!);
        }, //impactar la base de datos.
        child: ListTile(
          leading: Icon(
            this.tipo == 'http' //ternario
                ? Icons.home_outlined
                : Icons.map_outlined,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black,
          ),
          onTap: () {
            launchURL(scans[i], context);
            print(scans[i].id);
          },
        ),
      ),
    );
  }
}
