import 'package:app_anotacoes/Pages/Homepage/HomePage.dart';
import 'package:app_anotacoes/Pages/Homepage/bloc/homepage_bloc.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Provider(
          create: (context) => HomepageBloc(),
          child: HomePage(),
        ));
  }
}
