import 'package:flutter/material.dart';

class FloatingActionCustom extends StatelessWidget {
  const FloatingActionCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.DEFAULT);

        String barcodeScanRes = 'https://eltiempo.com';

        print(barcodeScanRes);
      },
      child: Icon(
        Icons.filter_center_focus,
        color: Colors.black,
      ),
    );
  }
}
