part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  const HomepageEvent();

  @override
  List<Object> get props => [];
}

class HomeFetchList extends HomepageEvent {}

class HomeFetchListWithError extends HomepageEvent {}

class HomeFetchEmpytyList extends HomepageEvent {}

class CreateAnotation extends HomepageEvent {
  final String titulo;
  final String descricao;

  CreateAnotation(this.titulo, this.descricao);
}

class UpdateAnotation extends HomepageEvent {
  final AnotacaoModel model;

  UpdateAnotation({required this.model});
}
