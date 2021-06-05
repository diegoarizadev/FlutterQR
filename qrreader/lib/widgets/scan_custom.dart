import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';

class FloatingActionCustom extends StatelessWidget {
  const FloatingActionCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.DEFAULT);

        String barcodeScanRes = 'https://eltiempo.com';

        final scanListProvider = Provider.of<ScanListProvider>(
            context, //Busca en el arbol de widget el provider ScanListProvider
            listen:
                false); //No se requiere que se redibuje, por lo tanto se envia el parametro listen en false.

        scanListProvider.newScan(barcodeScanRes);
        scanListProvider.newScan('geo:15.33,15.34');
      },
      child: Icon(
        Icons.filter_center_focus,
        color: Colors.black,
      ),
    );
  }
}
