part of 'loan_registration_bloc.dart';

abstract class LoanRegistrationEvent extends Equatable {
  const LoanRegistrationEvent();
  @override
  List<Object> get props => [];
}

class InitSteps extends LoanRegistrationEvent {
  final int total;

  final int startAt;
  const InitSteps({required this.total, this.startAt = 0});

  @override
  List<Object> get props => [total, startAt];
}

class GoToStep extends LoanRegistrationEvent {
  final int index;
  const GoToStep(this.index);
  @override
  List<Object> get props => [index];
}

class NextStepsEvent extends LoanRegistrationEvent {
  const NextStepsEvent();
}

class PrevStepsEvent extends LoanRegistrationEvent {
  const PrevStepsEvent();
}

class MarkCompleted extends LoanRegistrationEvent {
  final int index;
  final bool completed;
  const MarkCompleted(this.index, {this.completed = true});

  @override
  List<Object> get props => [index, completed];
}
