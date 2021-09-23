import 'package:app_anotacoes/Pages/Homepage/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAnotationWidget extends StatelessWidget {
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Anotação"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
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
                          .add(CreateAnotation(_titulo.text, _descricao.text));
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
