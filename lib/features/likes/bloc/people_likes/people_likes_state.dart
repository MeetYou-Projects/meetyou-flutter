part of 'people_likes_bloc.dart';

@immutable
abstract class PeopleLikesState {}

class PeopleLikesInitial extends PeopleLikesState {}

class PeopleLikesLoading extends PeopleLikesState {}

class PeopleLikesLoaded extends PeopleLikesState {
  final List<User> userMatch;

  PeopleLikesLoaded(this.userMatch);
}
