import 'package:flutter/material.dart';
import 'package:qrreader/widgets/scan_tiles.dart';

class HistoryDirectionsPage extends StatelessWidget {
  const HistoryDirectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'http');
  }
}
