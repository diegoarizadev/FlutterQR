import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/models/scan_model.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/utils/utils.dart';

class FloatingActionCustom extends StatelessWidget {
  const FloatingActionCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.DEFAULT);

        //String barcodeScanRes = 'https://eltiempo.com';
        String barcodeScanRes = 'geo:45.280089,-75.922405';

        if (barcodeScanRes == -1) {
          return;
        }

        final scanListProvider = Provider.of<ScanListProvider>(
            context, //Busca en el arbol de widget el provider ScanListProvider
            listen:
                false); //No se requiere que se redibuje, por lo tanto se envia el parametro listen en false.

        final ScanModel newscan =
            await scanListProvider.newScan(barcodeScanRes);

        launchURL(newscan, context);
      },
      child: Icon(
        Icons.filter_center_focus,
        color: Colors.black,
      ),
    );
  }
}
