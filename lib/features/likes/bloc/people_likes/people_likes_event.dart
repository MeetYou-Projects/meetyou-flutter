part of 'people_likes_bloc.dart';

@immutable
abstract class PeopleLikesEvent {}

class onPeopleLikesEventCalled extends PeopleLikesEvent {}

class AddPeopleLikesEvent extends PeopleLikesEvent {
  final User user;

  AddPeopleLikesEvent(this.user);
}
