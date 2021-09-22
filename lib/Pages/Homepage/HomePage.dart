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
      body: BlocBuilder<HomepageBloc, HomepageState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeLoadedState) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(state.list[index].titulo),
                    tileColor: Colors
                        .primaries[Random().nextInt(Colors.accents.length)],
                  ),
                );
              },
            );
          }
          return Container(
              padding: EdgeInsets.all(10),
              child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<HomepageBloc>().add(HomeFetchList());
                      },
                      child: Text(
                        "Atualizar",
                      ))));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context
              .read<HomepageBloc>()
              .add(CreateAnotation("Outro teste", "Outra Descricao"));
          context.read<HomepageBloc>().add(HomeFetchList());
        },
      ),
    );
  }
}
