import 'package:app_anotacoes/Models/AnotacaoModel.dart';
import 'package:app_anotacoes/data/database.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc(HomepageState initialState) : super(HomepageInitial());
  Stream<HomepageState> mapEventToState(event) async* {
    if (event is HomeFetchList) {
      yield HomeLoadingState();
    }
  }

  Stream<HomepageState> _fetchAnotacoes() async* {
    try {
      final List<AnotacaoModel> list = await AnotacaoDatabase.getAll();
      yield HomeLoadedState(list: list);
    } catch (e) {}
  }
}
