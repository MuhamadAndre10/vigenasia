part of 'motivation_bloc.dart';

@immutable
sealed class MotivationEvent {}

class PostMotivation extends MotivationEvent {
  final MotivationRequestModel motivation;

  PostMotivation(this.motivation);
}
