part of 'motivation_bloc.dart';

@immutable
sealed class MotivationState {}

final class MotivationInitial extends MotivationState {}

final class MotivationLoading extends MotivationState {}

final class MotivationSuccess extends MotivationState {
  final MotivationResponseModel motivation;

  MotivationSuccess(this.motivation);
}

final class MotivationError extends MotivationState {
  final String message;

  MotivationError(this.message);
}
