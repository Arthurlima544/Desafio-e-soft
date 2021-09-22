import 'dart:math';

import 'package:app_anotacoes/Pages/Homepage/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Things"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<HomepageBloc>().add(HomeFetchList()),
      ),
      body: BlocBuilder<HomepageBloc, HomepageState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
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
