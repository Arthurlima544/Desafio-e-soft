import 'dart:math';

import 'package:app_anotacoes/Models/AnotacaoModel.dart';
import 'package:app_anotacoes/Pages/Homepage/bloc/homepage_bloc.dart';
import 'package:app_anotacoes/Pages/widgets/CreateAnotationWidget.dart';
import 'package:app_anotacoes/Pages/widgets/UpdateAnotationWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Things"),
      ),
      body: BlocBuilder<HomepageBloc, HomepageState>(
        bloc: BlocProvider.of<HomepageBloc>(context),
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
                    onTap: () => _updateAnotacao(context, state.list[index]),
                    title: Text(state.list[index].titulo),
                    tileColor: Colors
                        .primaries[Random().nextInt(Colors.accents.length)],
                  ),
                );
              },
            );
          }
          BlocProvider.of<HomepageBloc>(context).add(HomeFetchList());
          return Center(
            child: CircularProgressIndicator(),
          );
          /* return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<HomepageBloc>().add(HomeFetchList());
                          },
                          child: Text(
                            "Atualizar",
                          ))),
                ],
              )); */
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _createAnotation(context);
        },
      ),
    );
  }

  _createAnotation(BuildContext blocContext) {
    Navigator.of(blocContext)
        .push(MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (BuildContext context) =>
                      HomepageBloc(HomeLoadingState()),
                  child: CreateAnotationWidget(),
                )))
        .then((value) =>
            BlocProvider.of<HomepageBloc>(blocContext).add(HomeFetchList()));
  }

  _updateAnotacao(BuildContext blocContext, AnotacaoModel anotacaoModel) {
    Navigator.of(blocContext)
        .push(MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (BuildContext context) => HomepageBloc(
                      AnotacaoModelLoadedState(model: anotacaoModel)),
                  child: UpdateAnotationWidget(),
                )))
        .then((value) =>
            BlocProvider.of<HomepageBloc>(blocContext).add(HomeFetchList()));
  }
}
