// loan_registration_event.dart
part of 'loan_registration_bloc.dart';

abstract class LoanRegistrationEvent extends Equatable {
  const LoanRegistrationEvent();
  @override
  List<Object?> get props => [];
}

class InitSteps extends LoanRegistrationEvent {
  final int total;
  final int startAt;
  const InitSteps({required this.total, this.startAt = 0});
  @override
  List<Object?> get props => [total, startAt];
}

class NextStepsEvent extends LoanRegistrationEvent {
  const NextStepsEvent();
}

class PrevStepsEvent extends LoanRegistrationEvent {
  const PrevStepsEvent();
}

class GoToStep extends LoanRegistrationEvent {
  final int index;
  const GoToStep(this.index);
  @override
  List<Object?> get props => [index];
}

class MarkCompleted extends LoanRegistrationEvent {
  final int index;
  final bool completed;
  const MarkCompleted(this.index, {this.completed = true});
  @override
  List<Object?> get props => [index, completed];
}

// Submit the borrower page only
class SubmitBorrowerInfo extends LoanRegistrationEvent {
  //final String token;
  final BorrowerEntity borrower;
  const SubmitBorrowerInfo({required this.borrower});
  @override
  List<Object?> get props => [ borrower];
}

// Submit the whole loan registration payload
class SubmitLoanRegistration extends LoanRegistrationEvent {
  final LoanRegistrationEntity payload;
  const SubmitLoanRegistration({
    required this.payload
  });
  @override
  List<Object?> get props => [ payload];
}
