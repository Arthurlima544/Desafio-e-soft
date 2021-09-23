part of 'homepage_bloc.dart';

abstract class HomepageState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomepageInitial extends HomepageState {}

class HomeLoadingState extends HomepageState {}

class HomeLoadedState extends HomepageState {
  final List<AnotacaoModel> list;

  HomeLoadedState({required this.list});
}

class AnotacaoModelLoadedState extends HomepageState {
  final AnotacaoModel model;

  AnotacaoModelLoadedState({required this.model});
}
