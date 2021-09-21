import 'dart:math';

import 'package:app_anotacoes/Pages/Homepage/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Things"),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            child: ListTile(
              title: Text("Teste"),
              tileColor:
                  Colors.primaries[Random().nextInt(Colors.accents.length)],
            ),
          );
        },
      ),
    );
  }
}
