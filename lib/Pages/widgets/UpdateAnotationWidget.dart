import 'package:app_anotacoes/Models/AnotacaoModel.dart';
import 'package:app_anotacoes/Pages/Homepage/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateAnotationWidget extends StatelessWidget {
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _descricao = TextEditingController();
  final AnotacaoModel anotacaoModel;

  UpdateAnotationWidget({required this.anotacaoModel});

  @override
  Widget build(BuildContext context) {
    bool concluido = anotacaoModel.concluido;
    return Scaffold(
      appBar: AppBar(
        title: Text("Editando Anotação"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Center(
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(60),
                        child: Column(
                          children: [
                            Text(
                              "Titulo: ${anotacaoModel.titulo}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Descricao: ${anotacaoModel.descricao}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.blue,
                    ),
                  ),
                  TextFormField(
                    controller: _titulo,
                    decoration: InputDecoration(
                      hintText: 'Titulo',
                    ),
                  ),
                  TextFormField(
                    controller: _descricao,
                    decoration: InputDecoration(
                      hintText: 'Descricao',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<HomepageBloc>(context)
                          .add(UpdateAnotation(
                              model: AnotacaoModel(
                        anotacaoModel.id,
                        _titulo.text,
                        _descricao.text,
                        anotacaoModel.concluido,
                      )));
                      Navigator.pop(context);
                    },
                    child: Text("Salvar"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
