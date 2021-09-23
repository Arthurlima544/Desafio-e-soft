import 'package:app_anotacoes/Models/AnotacaoModel.dart';
import 'package:app_anotacoes/data/database.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc(HomepageState initialState) : super(HomepageInitial());
  Stream<HomepageState> mapEventToState(event) async* {
    if (event is HomeFetchList) {
      yield HomeLoadingState();
      final List<AnotacaoModel> list = await AnotacaoDatabase().getList();
      if (list.isEmpty) {
        yield HomeLoadedEmptyListState();
      } else {
        yield HomeLoadedState(list: list);
      }
    }
    if (event is CreateAnotation) {
      var uuid = Uuid();
      String id = uuid.v4();
      await AnotacaoDatabase()
          .create(AnotacaoModel(id, event.titulo, event.descricao, false));
      yield HomeLoadingState();
      final List<AnotacaoModel> list = await AnotacaoDatabase().getList();
      yield HomeLoadedState(list: list);
    }
    if (event is UpdateAnotation) {
      yield HomeLoadingState();
      AnotacaoModel model = event.model;
      await AnotacaoDatabase().update(model);
      yield AnotacaoModelLoadedState(model: model);
    }
    if (event is DeleteAnotation) {
      yield HomeLoadingState();
      String id = event.id;
      await AnotacaoDatabase().delete(id);
      final List<AnotacaoModel> list = await AnotacaoDatabase().getList();
      if (list.isEmpty) {
        yield HomeLoadedEmptyListState();
      } else {
        yield HomeLoadedState(list: list);
      }
    }
  }
}
