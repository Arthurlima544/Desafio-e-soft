import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AnotacaoModel extends Equatable {
  final String id;
  final String titulo;
  final String descricao;
  final bool concluido;

  AnotacaoModel({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.concluido,
  });
  @override
  List<Object?> get props => [titulo, descricao, concluido];
}
