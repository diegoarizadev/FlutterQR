import 'package:qrreader/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

const _url = 'https://flutter.dev';
void launchURL(ScanModel scan, BuildContext context) async {
  final url = scan.valor; //Obtener la URL

  if (scan.tipo == 'http') {
    //Navegacion Http
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se ha podido poner en marcha  $_url';
    }
  } else {
    //Navegacion geo
    Navigator.pushNamed(context, 'HistoryMap', arguments: scan);
  }
}
