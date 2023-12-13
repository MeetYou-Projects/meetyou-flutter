import 'package:bloc/bloc.dart';
import 'package:meetyou/features/likes/data/data_match_dummy.dart';
import 'package:meetyou/features/likes/models/user_model.dart';
import 'package:meta/meta.dart';

part 'people_likes_event.dart';
part 'people_likes_state.dart';

class PeopleLikesBloc extends Bloc<PeopleLikesEvent, PeopleLikesState> {
  PeopleLikesBloc() : super(PeopleLikesInitial()) {
    on<onPeopleLikesEventCalled>((event, emit) async {
      emit(PeopleLikesLoading());
      await Future.delayed(Duration(seconds: 2));
      emit(PeopleLikesLoaded(dataMatchDummy));
    });

    on<AddPeopleLikesEvent>((event, emit) {
      emit(PeopleLikesLoading());
      dataMatchDummy.add(event.user);
      emit(PeopleLikesLoaded(dataMatchDummy));
    });
  }
}
