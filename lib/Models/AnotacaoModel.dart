import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AnotacaoModel extends Equatable {
  final String titulo;
  final String descricao;
  final bool concluido;
  final Color cor;

  AnotacaoModel({
    required this.titulo,
    required this.descricao,
    required this.concluido,
    required this.cor,
  });
  @override
  List<Object?> get props => [titulo, descricao, concluido, cor];
}
