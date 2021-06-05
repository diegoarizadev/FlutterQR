import 'package:flutter/material.dart';

class MapPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (_, i) => ListTile(
              leading: Icon(
                Icons.map,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('Http'),
              subtitle: Text('ID'),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
              onTap: () {
                print('Goooooooo');
              },
            ));
  }
}
