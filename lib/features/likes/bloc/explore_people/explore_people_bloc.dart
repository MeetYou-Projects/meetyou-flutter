import 'package:bloc/bloc.dart';
import 'package:meetyou/features/likes/data/data_user_dummy.dart';
import 'package:meetyou/features/likes/models/user_model.dart';
import 'package:meta/meta.dart';

part 'explore_people_event.dart';
part 'explore_people_state.dart';

class ExplorePeopleBloc extends Bloc<ExplorePeopleEvent, ExplorePeopleState> {
  ExplorePeopleBloc() : super(ExplorePeopleInitial()) {
    on<OnExplorePeopleEventCalled>((event, emit) async {
      emit(ExplorePeopleLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(ExplorePeopleLoaded(dataUserDummy));
    });
  }
}
