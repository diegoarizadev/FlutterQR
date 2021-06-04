import 'package:flutter/material.dart';
import 'package:qrreader/widgets/navigatorbar_custom.dart';
import 'package:qrreader/widgets/scan_custom.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, //elimina la sombra
        title: Text(
          'Historial',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete_forever,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Center(
        child: Text('HomePage'),
      ),
      bottomNavigationBar: NavigationBarCustom(),
      floatingActionButton: FloatingActionCustom(),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //Centra el floatingActionButton
    );
  }
}
